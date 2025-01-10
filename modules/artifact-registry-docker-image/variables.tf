variable "location" {
  type        = string
  nullable    = true
  default     = null
  description = <<EOF
    The location of the registry. If not provided, the region of the current client
    configuration will be used.
  EOF
}

variable "project_id" {
  type        = string
  nullable    = true
  default     = null
  description = <<EOF
    The project ID of the registry. If not provided, the project of the current client
    configuration will be used.
  EOF
}

variable "registry" {
  type        = string
  description = "The name of the registry."
}

variable "name" {
  type        = string
  description = "The name of the image."
}
