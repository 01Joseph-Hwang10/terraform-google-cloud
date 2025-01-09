
output "id" {
  value       = "${var.connection}/repositories/${var.repository}"
  description = "Full path of the repository"
}
