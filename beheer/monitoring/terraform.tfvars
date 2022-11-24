rg_prefix           = "beheer-monitoring"
rg_prefix_short     = "monitoring"
location            = "West Europe"
vm_user_name        = "deploy_infra"
public_ssh_key_path = "../../keys/id_rsa_deploy_infra.pub"
tags = {
  "CreatedBy"   = "terraform",
  "Environment" = "sandbox",
  "Project"     = "Beheer Monitoring"
}
