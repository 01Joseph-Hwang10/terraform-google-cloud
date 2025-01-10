output "credentials" {
  value       = local.artifact_registry_pypi_credentials
  description = "Object with username and password for artifact registry pypi credentials"
  sensitive   = true
}

output "username" {
  value       = local.artifact_registry_pypi_credentials.username
  description = "Username for artifact registry pypi credentials"
}

output "password" {
  value       = local.artifact_registry_pypi_credentials.password
  description = "Password for artifact registry pypi credentials"
  sensitive   = true
}
