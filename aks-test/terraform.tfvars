rg_prefix           = "aks-test"
rg_prefix_short     = "aks-test"
env_rg_name_prefix  = "rg-nw-test"
location            = "West Europe"
vm_user_name        = "deploy_infra"
public_ssh_key_path = "../keys/id_rsa_deploy_infra.pub"

aks_agent_count    = 3
aks_agent_vm_size  = "Standard_D2_v2"
kubernetes_version = "1.19.9"

infra_aad_group = "Infrastructure Team"

tags = {
  "CreatedBy"   = "terraform",
  "Environment" = "sandbox",
  "Project"     = "aks-test"
}

