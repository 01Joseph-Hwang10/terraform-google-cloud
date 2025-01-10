# IAM Service Account Module

This module creates new IAM service accounts and generates a key for them if specified.

## Usage

```hcl
module "service_account" {
  source  = "01Joseph-Hwang10/cloud/google//modules/iam-service-account"
  
  account_id = "my-service-account"
  display_name = "My Service Account"
  description = "This is my service account"

  key = true
}
```
