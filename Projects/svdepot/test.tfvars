rg_prefix           = "sb-test-svdepot"
rg_prefix_short     = "svdepot"
sn_prefix_svdwl     = "test-svdwl"
sn_prefix_svddb     = "test-svddb"
sn_prefix_svdps     = "test-svdps"
location            = "West Europe"
rg_prefix_network   = "nw-test"
vm_user_name        = "deploy_infra"
public_ssh_key_path = "../../keys/id_rsa_deploy_infra.pub"
tags = {
  "CreatedBy"   = "terraform",
  "Environment" = "sb-test",
  "Project"     = "svdepot"
}

virtualmachines-wl = [
  {
    hostname        = "vm-svdwlt-0001",
    location        = "West Europe"
    size            = "Standard_DS2_v2",
    offer           = "RHEL",
    publisher       = "RedHat",
    sku             = "8-LVM",
    version         = "latest",
    osdisk_size     = 128,
    create_datadisk = true,
    datadisk_size   = 100,
    zone            = 1
    vm_tags = {
      "CreatedBy"   = "terraform",
      "Environment" = "test",
      "Project"     = "svdepot"
      "Role"        = "webserver",
      "Type"        = "weblogic"
    }
  }
  ]

  sec_rules_svdwl = [
  {
    name                       = "AllowSSHfromAutomation"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    source_address_prefixes    = ["172.20.0.0/26"]
    destination_port_range     = "22"
    destination_address_prefix = "172.17.0.0/28"
  }
  ]