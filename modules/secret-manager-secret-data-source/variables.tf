variable "project_id" {
  type        = string
  nullable    = true
  default     = null
  description = <<EOF
    The project ID to use for this secret.
    
    If not provided, the project ID will be determined from the provider configuration.
  EOF
}

variable "id" {
  type        = string
  description = "The ID of the secret to read."
}
