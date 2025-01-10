data "google_client_config" "current" {}

locals {
  effective_project_id = coalesce(var.project, data.google_client_config.current.project)
}

resource "google_service_account" "service_account" {
  account_id   = var.account_id
  display_name = var.display_name
  description  = var.description
  project      = local.effective_project_id
}

resource "google_service_account_key" "service_account_key" {
  count              = var.key ? 1 : 0
  service_account_id = google_service_account.service_account.name
}

locals {
  key_raw    = one(google_service_account_key.service_account_key[*].private_key)
  key_json   = local.key_raw == null ? null : base64decode(local.key_raw)
  key_object = local.key_json == null ? null : jsondecode(local.key_json)
}
