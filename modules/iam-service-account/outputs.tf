output "account" {
  value = merge(
    google_service_account.service_account,
    {
      key = {
        raw    = local.key_raw
        json   = local.key_json
        object = local.key_object
      }
    }
  )
  description = <<EOF
    The service account resource and its key.

    You can access the service account key in different formats:
      - raw: The raw private key in base64 encoded format.
      - json: The private key in JSON format.
      - object: The private key in object format.
      
    The key is only generated if var.key is set to true.
  EOF
}
