
output "credentials" {
  value       = local.artifact_registry_npm_credentials
  description = "Object containing the username and password for the npm registry."
}

output "username" {
  value       = local.artifact_registry_npm_credentials.username
  description = "Username for the npm registry."
}

output "password" {
  value       = local.artifact_registry_npm_credentials.password
  description = "Password for the npm registry."
}
