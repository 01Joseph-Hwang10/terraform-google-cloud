data "google_client_config" "current" {}

locals {
  effective_project_id = coalesce(var.project_id, data.google_client_config.current.project)
}

data "google_secret_manager_secret" "secret" {
  project   = local.effective_project_id
  secret_id = var.id
}

data "google_secret_manager_secret_version" "secret" {
  secret = data.google_secret_manager_secret.secret.id
}
