rg_prefix            = "nw-beheer"
rg_prefix_short      = "beheer"
location             = "West Europe"
address_space_prefix = "172.20"
vm_user_name         = "deploy_infra"
public_ssh_key_path  = "../../keys/id_rsa_deploy_infra.pub"
tags = {
  "CreatedBy"   = "terraform",
  "Environment" = "sandbox",
  "Project"     = "beheer networking"
}

