variable "connection" {
  type        = string
  description = "Connection string to the repository. Use `cloudbuild-connection` module to create it."
}

variable "repository" {
  type        = string
  description = "Name of the repository."
}
