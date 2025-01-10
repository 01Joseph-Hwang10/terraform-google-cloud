output "secret" {
  value       = google_secret_manager_secret.secret
  description = "Google secret manager secret resource."
}

output "version" {
  value       = google_secret_manager_secret_version.secret
  description = "Google secret manager secret version resource."
}

output "value" {
  value       = google_secret_manager_secret_version.secret.secret_data
  description = "The secret value."
}
