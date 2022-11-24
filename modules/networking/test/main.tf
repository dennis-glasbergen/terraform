module "networking_test" {
  source = "../module"

  rg_prefix            = "nw-test"
  rg_prefix_short      = "test"
  location             = "West Europe"
  address_space_prefix = "172.17"
  vm_user_name         = "deploy_infra"
  public_ssh_key_path  = "../../keys/id_rsa_deploy_infra.pub"
  rg_nw_services       = "rg-nw-services"

  tags = {
    "CreatedBy" = "terraform",
    "Environment" = "test",
    "Project" = "sandbox",
    "Department" = "Cloud Infra"
  }

}
