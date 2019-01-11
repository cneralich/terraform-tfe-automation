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
  default = {}
}

variable "count" {}
