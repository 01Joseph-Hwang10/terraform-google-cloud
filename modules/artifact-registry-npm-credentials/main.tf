locals {
  artifact_registry_npm_credentials = {
    username = var.username
    # Notes:
    # 1. Unlike python artifact registry, npm registry
    #    requires "doubly" base64 encoded service account key json file.
    # 2. One cloudbuild substitution variable can only have a maximum of 4KB size.
    # 3. Doubly base64 encoded service account key json file 
    #    usually exceeds 4KB size, so we need to pass singly encoded json key file
    #    and encode it again on running cloud build container.
    #
    # References:
    # - https://cloud.google.com/artifact-registry/docs/nodejs/authentication#auth-password
    # - https://cloud.google.com/build/docs/configuring-builds/substitute-variable-values#using_user-defined_substitutions
    #
    # [24.04.16]:
    # 1. Seems like `gcloud` CLI's base64 encoding algorithm is
    #    slightly different, making password at below invalid.
    # 2. But the password below works in the local environment. (🤯)
    # 3. We need to further investigate this issue soon.
    password = base64encode(var.credentials)
  }
}
