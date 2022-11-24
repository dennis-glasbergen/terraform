rg_prefix           = "sb-prod-dadp"
rg_prefix_short     = "dadp"
rg_subnet_prefix    = "prod-dadp"
rg_datafactory      = "dadp-df-prod"
location            = "West Europe"
rg_prefix_network   = "nw-prod"
vm_user_name        = "deploy_infra"
public_ssh_key_path = "../../keys/id_rsa_deploy_infra.pub"
tags = {
  "CreatedBy"   = "terraform",
  "Environment" = "sandbox-prod",
  "Project"     = "dadp"
}


virtualmachines = [
    {
      hostname        = "vm-dadp-p-0001",
      size            = "Standard_DS2_v2",
      offer           = "WindowsServer",
      publisher       = "MicrosoftWindowsServer",
      sku             = "2019-Datacenter",
      version         = "latest",
      osdisk_size     = 128,
      create_datadisk = false,
      datadisk_size   = 0,
      zone            = 1
    },
    {
      hostname        = "vm-dadp-p-0002",
      size            = "Standard_DS2_v2",
      offer           = "WindowsServer",
      publisher       = "MicrosoftWindowsServer",
      sku             = "2019-Datacenter",
      version         = "latest",
      osdisk_size     = 128,
      create_datadisk = false,
      datadisk_size   = 0,
      zone            = 1
    }
  ]
