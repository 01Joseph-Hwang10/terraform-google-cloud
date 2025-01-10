variable "username" {
  type    = string
  default = "_json_key_base64"
}

variable "credentials" {
  type        = string
  sensitive   = true
  description = "Base64 encoded service account json key file"
}

