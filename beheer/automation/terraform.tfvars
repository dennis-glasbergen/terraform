rg_prefix           = "beheer-automation"
rg_prefix_short     = "automation"
location            = "West Europe"
vm_user_name        = "deploy_infra"
public_ssh_key_path = "../../keys/id_rsa_deploy_infra.pub"
tags = {
  "CreatedBy"   = "terraform",
  "Environment" = "beheer",
  "Project"     = "Beheer Automation"
}

