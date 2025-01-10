output "ip_address" {
  description = "The IP address of the entrypoint of this MIG"
  value       = google_compute_global_forwarding_rule.default.ip_address
}
