# Cloudbuild Connection Repository Module

This module computes the cloudbuild connection id for a specified repository.

## Usage

```hcl
module "my_connection" {
  source = "01Joseph-Hwang10/cloud/google//modules/cloudbuild-connection"

  project_id = "my-project" # Optional. If not provided, the provider project is used
  location = "us-central1" # Optional. If not provided, the provider location is used
  name = "my-connection"
}

module "my_repository" {
  source = "01Joseph-Hwang10/cloud/google//modules/cloudbuild-connection-repository" 

  connection = module.my_connection.id
  repository = "my-repository"
}
```
