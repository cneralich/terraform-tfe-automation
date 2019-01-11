# tfe-automation

This repo can be the basis for a module in your Private Module Registry in TFE for quick workspace setup.  An example use might look something like:

module "automation" {
  source  = "app.terraform.io/workspace-name/example/test"
  version = "1.0"
  
  tfe_vars = {}

  tfe_vars_sensitive = {}

  env_vars_sensitive = {}
    
  setup_vars = {}
}
