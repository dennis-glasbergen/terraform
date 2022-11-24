rg_prefix            = "nw-services"
location             = "West Europe"
address_space_prefix = "172.16"
vm_user_name         = "deploy_infra"
public_ssh_key_path  = "../keys/id_rsa_deploy_infra.pub"
tags = {
  "createdby"   = "terraform",
  "environment" = "sandbox",
  "project"     = "beheer"
}

