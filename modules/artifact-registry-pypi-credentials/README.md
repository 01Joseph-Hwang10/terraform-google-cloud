# Artifact Registry PyPI Credentials Module

This module computes the PyPI credentials for a given artifact registry repository.

## Usage

```hcl
module "my_pypi_credentials" {
  source = "01Joseph-Hwang10/cloud/google//modules/artifact-registry-pypi-credentials"
  
  credentials = "..." # Base64 encoded JSON service account key file
}
```
