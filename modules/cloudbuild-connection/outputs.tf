output "id" {
  value       = "projects/${var.project_id}/locations/${var.location}/connections/${var.name}"
  description = "The fully qualified identifier for the connection."
}
