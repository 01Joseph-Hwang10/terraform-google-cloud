# Cloudbuild default service accounts

This module computes the default service accounts for Cloud Build.

## Usage

```hcl
module "cloudbuild_default_service_accounts" {
  source  = "01Joseph-Hwang10/cloud/google//modules/cloudbuild-default-service-accounts"

  project = "..." # Project number
}

locals {
  cloudbuild_service_agent_email = module.cloudbuild_default_service_accounts.cloudbuild_service_agent.email
  legacy_cloudbuild_service_agent_email = module.cloudbuild_default_service_accounts.legacy_cloudbuild_service_agent.email
}
```

