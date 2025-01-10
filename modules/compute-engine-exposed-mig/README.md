# Compute Engine Exposed MIG

This module creates a Compute Engine Managed Instance Group (MIG) which is exposed to the internet.

## Usage

```hcl
module "mig" {
  source = "01Joseph-Hwang10/cloud/google//modules/compute-engine-exposed-mig"

  network              = google_compute_network.default
  compute_machine_type = "e2-standard-2"
  ns                   = "ns1"

  tags            = ["tags"]
  service_account = google_service_account.compute_service_account

  startup_script = <<-EOF
    #!/bin/bash
    
    # Your startup script here
    # ...
  EOF
}
```
