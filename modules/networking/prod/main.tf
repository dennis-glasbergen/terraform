module "networking_prod" {
  source = "../module"

  rg_prefix            = "nw-prod"
  rg_prefix_short      = "prod"
  location             = "West Europe"
  address_space_prefix = "172.19"
  vm_user_name         = "deploy_infra"
  public_ssh_key_path  = "../../keys/id_rsa_deploy_infra.pub"
  rg_nw_services       = "rg-nw-services"

  tags = {
    "CreatedBy" = "terraform",
    "Environment" = "prod",
    "Project" = "sandbox",
    "Department" = "Cloud Infra"
  }
}
