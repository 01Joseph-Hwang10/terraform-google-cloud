variable "github_owner" {
  type        = string
  description = <<EOT
    Variable for GitHub owner.

    This represents what account or organization the repository will be created under.
  EOT
}

variable "gh_pat" {
  type        = string
  description = <<EOT
    Variable for GitHub Personal Access Token (PAT).

    This is used to authenticate with GitHub and create the repository.
  EOT
  sensitive   = true
}
