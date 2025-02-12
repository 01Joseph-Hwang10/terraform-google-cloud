variable "tags" {
  description = "The tags to apply to the resources"
  type        = list(string)
  default     = ["http-server"]
}

variable "compute_machine_type" {
  description = "The machine type to use for the compute instances"
  type        = string
}

variable "startup_script" {
  description = "Startup script to run on the compute instances"
  type        = string
  default     = ""
}

variable "ns" {
  description = "The namespace to apply to the resources"
  type        = string
}

variable "network" {
  description = "The network to deploy the resources to"
}

variable "service_account" {
  description = "The service account to use for the compute instances"
}

variable "source_image" {
  description = "The source image to use for the compute instances"
  type        = string
  nullable    = true
  default     = null
}

variable "preemptible" {
  description = "Whether the instances should be preemptible"
  type        = bool
  default     = false
}

variable "replace_triggered_by" {
  description = "The trigger that caused the replacement of the instances"
  type        = list(string)
  nullable    = true
  default     = null
}
