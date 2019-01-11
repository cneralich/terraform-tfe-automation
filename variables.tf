variable "tfe_vars" {
  type        = "map"
  description = "Put all non-sensitive terraform variables here"
  default     = {}
}

variable "tfe_vars_sensitive" {
  type        = "map"
  description = "Put all sensitive terraform variables here"
  default     = {}
}

variable "env_vars" {
  type        = "map"
  description = "Put all non-sensitive env variables here"
  default     = {}
}

variable "env_vars_sensitive" {
  type        = "map"
  description = "Put all sensitive env variables here"
  default     = {}
}

variable "setup_vars" {
  type        = "map"
  description = "Put all variables that are not meant to be tfvars or env variables in the TFE Workspace"

  default = {
    token              = ""    # Required - This can be obtained from https://app.terraform.io/app/settings/tokens
    name               = ""    # Required
    organization       = ""    # Required
    working_directory  = ""    # Optional
    vcs_repo           = ""    # Optional
    oauth_token_id     = ""    # Required if vcs_repo block included. This can be obtained by following instructions at https://www.terraform.io/docs/enterprise/api/oauth-clients.html#sample-request
    identifier         = ""    # Required if vcs_repo block included
    auto_apply         = false
    queue_all_runs     = true
    terraform_version  = ""    # Optional
    auto_apply         = false
    ssh_key_id         = ""    # Optional
    queue_all_runs     = true
    branch             = ""    # Optional
    ingress_submodules = false
  }
}

variable "count" {}
