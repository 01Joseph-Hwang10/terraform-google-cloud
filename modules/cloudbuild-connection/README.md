# Cloudbuild Connection Module

This module computes the cloudbuild connection id for a given project and region.

## Usage

```hcl
module "my_connection" {
  source = "01Joseph-Hwang10/cloud/google//modules/cloudbuild-connection"

  project_id = "my-project" # Optional. If not provided, the provider project is used
  location = "us-central1" # Optional. If not provided, the provider location is used
  name = "my-connection"
}
```
