output "url" {
  value       = "${local.effective_location}-docker.pkg.dev/${local.effective_project_id}/${var.name}"
  description = "The URL of the image."
}
