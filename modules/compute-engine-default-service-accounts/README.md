# Compute Engine Default Service Accounts

This module computes the default service accounts for Compute Engine.

## Usage

```hcl
module "cloudbuild_default_service_accounts" {
  source  = "01Joseph-Hwang10/cloud/google//modules/compute-engine-default-service-accounts"

  project = "..." # Project number
}

locals {
  compute_service_agent_email = module.compute_engine_default_service_accounts.compute_service_agent.email
}
```

