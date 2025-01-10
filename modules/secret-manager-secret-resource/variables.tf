variable "project_id" {
  type        = string
  nullable    = true
  default     = null
  description = <<EOF
    The project to manage the secret in. 
    If not set, the provider project is used.
  EOF
}

variable "id" {
  type        = string
  description = <<EOF
    The secret id. 
    Must be unique within the project.
  EOF
}

variable "value" {
  description = "The secret value."
  sensitive   = true
}
