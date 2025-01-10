locals {
  # JSON file used for poetry to login to private repository
  # It consists with 2 keys: username and password
  #
  # - username: "_json_key_base64" (fixed value) 
  # - password: base64 encoded service account json key file
  #
  # See: https://cloud.google.com/artifact-registry/docs/python/authentication?hl=ko#sa-key
  artifact_registry_pypi_credentials = {
    username = var.username
    password = var.credentials
  }
}

