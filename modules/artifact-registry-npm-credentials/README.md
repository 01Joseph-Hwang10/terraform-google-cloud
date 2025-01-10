# Artifact Registry npm Credentials Module

This module computes the npm credentials for a given artifact registry repository.

## Usage

```hcl
module "my_npm_credentials" {
  source = "01Joseph-Hwang10/cloud/google//modules/artifact-registry-npm-credentials"
  
  credentials = "..." # Base64 encoded JSON service account key file
}
```
