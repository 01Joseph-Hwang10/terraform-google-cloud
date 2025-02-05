# Google Secret Manager Secret Data Source

This module allows you to read a secret from Google Secret Manager.

## Usage

```hcl
module "my_secret" {
  source = "01Joseph-Hwang10/cloud/google//modules/secret-manager-secret-data-source" 

  id = "my-secret"
  project_id = "my-project" # Optional. If not provided, the provider project is used
}
```
