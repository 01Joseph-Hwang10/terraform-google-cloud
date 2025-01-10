output "secret" {
  value       = data.google_secret_manager_secret.secret
  description = <<EOF
    Google secret manager secret data source.
  EOF
}

output "version" {
  value       = data.google_secret_manager_secret_version.secret
  description = <<EOF
    Google secret manager secret version data source.
  EOF
}

output "value" {
  value       = data.google_secret_manager_secret_version.secret.secret_data
  description = "The secret value."
}
