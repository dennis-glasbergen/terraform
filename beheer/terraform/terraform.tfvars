rg_prefix           = "beheer-terraform"
rg_prefix_short     = "terraform"
location            = "West Europe"
vm_user_name        = "deploy_infra"
public_ssh_key_path = "../../keys/id_rsa_deploy_infra.pub"
tags = {
  "CreatedBy"   = "terraform",
  "Environment" = "beheer",
  "Project"     = "Beheer Terraform"
}

