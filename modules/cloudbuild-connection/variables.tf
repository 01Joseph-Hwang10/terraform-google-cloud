variable "project_id" {
  type        = string
  nullable    = true
  default     = null
  description = "Google Cloud Project ID. If not set, it will inherit the project ID from the parent module."
}

variable "location" {
  type        = string
  nullable    = true
  default     = null
  description = "Google Cloud location. If not set, it will inherit the location from the parent module."
}

variable "name" {
  type        = string
  description = "Name of the Cloud Build connection."
}
