output "compute_service_agent" {
  value = {
    email = "${var.project}-compute@developer.gserviceaccount.com"
  }
  description = <<EOF
    Compute Engine default service account

    This object has the following attributes:
    - email: The email address of the service account.
  EOF
}
