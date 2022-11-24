module "networking_accept" {
  source = "../module"

  rg_prefix            = "nw-accept"
  rg_prefix_short      = "accept"
  location             = "West Europe"
  address_space_prefix = "172.18"
  vm_user_name         = "deploy_infra"
  public_ssh_key_path  = "../../keys/id_rsa_deploy_infra.pub"
  rg_nw_services       = "rg-nw-services"

  tags = {
    "CreatedBy" = "terraform",
    "Environment" = "accept",
    "Project" = "sandbox",
    "Department" = "Cloud Infra"
  }

}
