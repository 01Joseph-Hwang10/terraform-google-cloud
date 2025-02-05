# Google Secret Manager Secret Resource

This module allows you to create a secret in Google Secret Manager.

## Usage

```hcl
module "my_secret" {
  source = "01Joseph-Hwang10/cloud/google//modules/secret-manager-secret-resource" 

  id = "my-secret"
  project_id = "my-project" # Optional. If not provided, the provider project is used
}
```
