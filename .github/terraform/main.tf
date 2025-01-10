resource "github_repository" "repository" {
  name         = "terraform-google-cloud"
  description  = "Set of abstracted modules to deploy resources on Google Cloud Platform"
  homepage_url = "https://registry.terraform.io/modules/01Joseph-Hwang10/cloud-build/google/latest"
  topics = [
    "terraform",
    "terraform-modules",
    "gcp",
    "google-cloud-platform",
    "cloud-build",
  ]

  visibility = "public"

  has_downloads   = true
  has_issues      = true
  has_projects    = true
  has_wiki        = true
  has_discussions = false
}

resource "github_actions_secret" "github_pat" {
  repository      = github_repository.repository.name
  secret_name     = "GH_PAT"
  plaintext_value = var.gh_pat
}
