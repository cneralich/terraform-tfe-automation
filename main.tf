provider "tfe" {
  token = "${lookup(var.setup_vars, "token")}"
}

resource "tfe_workspace" "main" {
  name              = "${lookup(var.setup_vars, "name")}"
  organization      = "${lookup(var.setup_vars, "organization")}"
  auto_apply        = "${lookup(var.setup_vars, "auto_apply")}"
  ssh_key_id        = "${lookup(var.setup_vars, "ssh_key_id")}"
  queue_all_runs    = "${lookup(var.setup_vars, "queue_all_runs")}"
  terraform_version = "${lookup(var.setup_vars, "terraform_version")}"
  working_directory = "${lookup(var.setup_vars, "working_directory")}"

  vcs_repo {
    identifier         = "${lookup(var.setup_vars, "vcs_repo")}"
    branch             = "${lookup(var.setup_vars, "branch")}"
    ingress_submodules = "${lookup(var.setup_vars, "ingress_submodules")}"
    oauth_token_id     = "${lookup(var.setup_vars, "oauth_token_id")}"
  }
}

resource "tfe_variable" "tfvars" {
  count        = "${length(var.tfe_vars)}"
  key          = "${element(keys(var.tfe_vars), count.index)}"
  value        = "${element(values(var.tfe_vars), count.index)}"
  category     = "terraform"
  workspace_id = "${tfe_workspace.main.id}"
}

resource "tfe_variable" "tfvars_sensitive" {
  count        = "${length(var.tfe_vars_sensitive)}"
  key          = "${element(keys(var.tfe_vars_sensitive), count.index)}"
  value        = "${element(values(var.tfe_vars_sensitive), count.index)}"
  category     = "terraform"
  sensitive    = true
  workspace_id = "${tfe_workspace.main.id}"
}

resource "tfe_variable" "env_vars" {
  count        = "${length(var.env_vars)}"
  key          = "${element(keys(var.env_vars), count.index)}"
  value        = "${element(values(var.env_vars), count.index)}"
  category     = "env"
  workspace_id = "${tfe_workspace.main.id}"
}

resource "tfe_variable" "env_vars_sensitive" {
  count        = "${length(var.env_vars_sensitive)}"
  key          = "${element(keys(var.env_vars_sensitive), count.index)}"
  value        = "${element(values(var.env_vars_sensitive), count.index)}"
  category     = "env"
  sensitive    = true
  workspace_id = "${tfe_workspace.main.id}"
}
