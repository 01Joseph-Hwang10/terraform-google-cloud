variable "account_id" {
  type        = string
  description = "The service account ID"
}

variable "display_name" {
  type        = string
  nullable    = true
  default     = null
  description = "Display name of the service account to set"
}

variable "description" {
  type        = string
  nullable    = true
  default     = null
  description = "Description of the service account to set"
}

variable "project" {
  type        = string
  nullable    = true
  default     = null
  description = <<EOF
    The project to create the service account in. 
    If it is not provided, it will inherit the project
    from the parent module.
  EOF
}

variable "key" {
  type        = bool
  default     = false
  description = <<EOF
    Whether to generate service account key or not.
    If set to true, a service account key will be generated.

    Note that this is a one time operation, so if you once set it to true,
    change it to false, and then back to true, it will generate a new key.
  EOF
}
