output "cloudbuild_service_agent" {
  value = {
    email = "service-${var.project}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
  }
  description = <<EOF
    Cloud Build default service account.
    
    This object has the following attributes:
    - email: The email address of the service account.
  EOF
}

output "legacy_cloudbuild_service_agent" {
  value = {
    email = "${var.project}@cloudbuild.gserviceaccount.com"
  }
  description = <<-EOF
    Legacy Cloud Build default service account.

    Note that the legacy service account is not recommended for use,
    but automatically set up by Google Cloud Build
    when deploying Google App Engine services with CLI.
    We need to further investigate how to deal with this soon.

    This object has the following attributes:
    - email: The email address of the service account.
  EOF
}
