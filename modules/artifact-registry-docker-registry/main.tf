data "google_client_config" "current" {}

locals {
  effective_project_id = coalesce(var.project_id, data.google_client_config.current.project)
  effective_location   = coalesce(var.location, data.google_client_config.current.region)
}
