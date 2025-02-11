data "google_client_config" "current" {}

#-----------------------
# GCE
#-----------------------
locals {
  l7-xlb-basic-check  = "${var.ns}-basic-check"
  l7-xlb-mig-template = "${var.ns}-mig-template-"
  l7-xlb-mig          = "${var.ns}-mig"
  base_instance_name  = "${var.ns}-vm"
}

data "google_compute_image" "debian_12" {
  family  = "debian-12"
  project = "debian-cloud"
}

locals {
  effective_source_image = coalesce(var.source_image, data.google_compute_image.debian_12.self_link)
}

resource "google_compute_instance_template" "default" {
  name_prefix  = local.l7-xlb-mig-template
  machine_type = var.compute_machine_type
  region       = data.google_client_config.current.region
  tags         = var.tags
  service_account {
    email  = var.service_account.email
    scopes = ["cloud-platform"]
  }
  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }
    network    = var.network.self_link
    subnetwork = google_compute_subnetwork.default.self_link
  }
  disk {
    auto_delete  = true
    boot         = true
    mode         = "READ_WRITE"
    source_image = local.effective_source_image
    type         = "PERSISTENT"
  }
  scheduling {
    preemptible         = var.preemptible
    automatic_restart   = var.preemptible ? false : true
    provisioning_model  = var.preemptible ? "SPOT" : "STANDARD"
    on_host_maintenance = var.preemptible ? "TERMINATE" : "MIGRATE"
  }
  metadata = {
    startup-script = var.startup_script,
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_region_instance_group_manager" "default" {
  name   = local.l7-xlb-mig
  region = data.google_client_config.current.region
  named_port {
    name = "http"
    port = 80
  }
  named_port {
    name = "https"
    port = 443
  }
  version {
    instance_template = google_compute_instance_template.default.id
    name              = "primary"
  }
  base_instance_name = local.base_instance_name
  target_size        = 1

  lifecycle {
    ignore_changes = [
      version[0].name
    ]
  }
}

resource "google_compute_health_check" "default" {
  name = local.l7-xlb-basic-check
  http_health_check {
    port_specification = "USE_SERVING_PORT"
    proxy_header       = "NONE"
    request_path       = "/"
  }
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
}

#-----------------------
# Network
#-----------------------
locals {
  l7-xlb-backend-subnet    = "${var.ns}-backend-subnet"
  l7-xlb-proxy-only        = "${var.ns}-proxy-only"
  l7-xlb-forwarding-rule   = "${var.ns}-forwarding-rule"
  l7-xlb-backend-service   = "${var.ns}-backend-service"
  l7-xlb-url-map           = "${var.ns}-url-map"
  l7-xlb-static-ip         = "${var.ns}-static-ip"
  l7-xlb-target-http-proxy = "${var.ns}-target-http-proxy"
  l7-xlb-fw-allow-iap-hc   = "${var.ns}-fw-allow-iap-hc"
}

resource "google_compute_subnetwork" "default" {
  name          = local.l7-xlb-backend-subnet
  ip_cidr_range = "10.0.1.0/24"
  region        = data.google_client_config.current.region
  network       = var.network.id
}

resource "google_compute_global_address" "default" {
  name = local.l7-xlb-static-ip
}

resource "google_compute_global_forwarding_rule" "default" {
  name                  = local.l7-xlb-forwarding-rule
  depends_on            = [google_compute_subnetwork.default]
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "80"
  target                = google_compute_target_http_proxy.default.id
}

resource "google_compute_target_http_proxy" "default" {
  name    = local.l7-xlb-target-http-proxy
  url_map = google_compute_url_map.default.id
}

resource "google_compute_url_map" "default" {
  name            = local.l7-xlb-url-map
  default_service = google_compute_backend_service.default.id
}

resource "google_compute_backend_service" "default" {
  name                  = local.l7-xlb-backend-service
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  timeout_sec           = 10
  health_checks         = [google_compute_health_check.default.id]
  backend {
    group           = google_compute_region_instance_group_manager.default.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
  log_config {
    enable      = true
    sample_rate = 1.0
  }
}

# allow all access from IAP and health check ranges
resource "google_compute_firewall" "fw_iap" {
  name          = local.l7-xlb-fw-allow-iap-hc
  direction     = "INGRESS"
  network       = var.network.id
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16", "35.235.240.0/20"]
  allow {
    protocol = "tcp"
  }
}

