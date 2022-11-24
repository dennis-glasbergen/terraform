rg_prefix           = "accept-svdepot"
rg_prefix_short     = "svdepot"
sn_prefix_svdwl     = "accept-svdwl"
sn_prefix_svddb     = "accept-svddb"
sn_prefix_svdps     = "accept-svdps"
location            = "West Europe"
rg_prefix_network   = "nw-accept"
vm_user_name        = "deploy_infra"
public_ssh_key_path = "../../keys/id_rsa_deploy_infra.pub"
tags = {
  "CreatedBy"   = "terraform",
  "Environment" = "accept",
  "Project"     = "svdepot"
}

virtualmachines-wl = [
  {
    hostname        = "vm-svdwla-0001",
    location        = "West Europe"
    size            = "Standard_D8s_v3",
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
      "Environment" = "accept",
      "Project"     = "svdepot"
      "Role"        = "webserver",
      "Type"        = "weblogic"
    }
  },
  {
    hostname        = "vm-svdwla-0002",
    location        = "West Europe"
    size            = "Standard_D8s_v3",
    offer           = "RHEL",
    publisher       = "RedHat",
    sku             = "8-LVM",
    version         = "latest",
    osdisk_size     = 128,
    create_datadisk = true,
    datadisk_size   = 100,
    zone            = 2
    vm_tags = {
      "CreatedBy"   = "terraform",
      "Environment" = "accept",
      "Project"     = "svdepot"
      "Role"        = "webserver",
      "Type"        = "weblogic"
    }
  },
  {
    hostname        = "vm-svdwla-0003",
    location        = "West Europe"
    size            = "Standard_D8s_v3",
    offer           = "RHEL",
    publisher       = "RedHat",
    sku             = "8-LVM",
    version         = "latest",
    osdisk_size     = 128,
    create_datadisk = true,
    datadisk_size   = 100,
    zone            = 3
    vm_tags = {
      "CreatedBy"   = "terraform",
      "Environment" = "accept",
      "Project"     = "svdepot"
      "Role"        = "webserver",
      "Type"        = "weblogic"
    }
  },
  {
    hostname        = "vm-svdwla-0004",
    location        = "North Europe"
    size            = "Standard_D8s_v3",
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
      "Environment" = "accept",
      "Project"     = "svdepot"
      "Role"        = "webserver",
      "Type"        = "weblogic"
    }
  },
  {
    hostname        = "vm-svdwla-0005",
    location        = "North Europe"
    size            = "Standard_D8s_v3",
    offer           = "RHEL",
    publisher       = "RedHat",
    sku             = "8-LVM",
    version         = "latest",
    osdisk_size     = 128,
    create_datadisk = true,
    datadisk_size   = 100,
    zone            = 2
    vm_tags = {
      "CreatedBy"   = "terraform",
      "Environment" = "accept",
      "Project"     = "svdepot"
      "Role"        = "webserver",
      "Type"        = "weblogic"
    }
  },
  {
    hostname        = "vm-svdwla-0006",
    location        = "North Europe"
    size            = "Standard_D8s_v3",
    offer           = "RHEL",
    publisher       = "RedHat",
    sku             = "8-LVM",
    version         = "latest",
    osdisk_size     = 128,
    create_datadisk = true,
    datadisk_size   = 100,
    zone            = 3
    vm_tags = {
      "CreatedBy"   = "terraform",
      "Environment" = "accept",
      "Project"     = "svdepot"
      "Role"        = "webserver",
      "Type"        = "weblogic"
    }
  }
]

virtualmachines-db = [
  {
    hostname        = "vm-svddba-0001",
    location        = "West Europe"
    size            = "Standard_DS14_v2",
    offer           = "RHEL",
    publisher       = "RedHat",
    sku             = "8-LVM",
    version         = "latest",
    osdisk_size     = 128,
    create_datadisk = true,
    datadisk_size   = 4000,
    zone            = 1
    db_tags = {
      "CreatedBy"   = "terraform",
      "Environment" = "accept",
      "Project"     = "svdepot"
      "Role"        = "dbserver",
      "Type"        = "Oracle"
    }
  },
  {
    hostname        = "vm-svddba-0002",
    location        = "North Europe"
    size            = "Standard_DS14_v2",
    offer           = "RHEL",
    publisher       = "RedHat",
    sku             = "8-LVM",
    version         = "latest",
    osdisk_size     = 128,
    create_datadisk = true,
    datadisk_size   = 4000,
    zone            = 3
    db_tags = {
      "CreatedBy"   = "terraform",
      "Environment" = "accept",
      "Project"     = "svdepot"
      "Role"        = "dbserver",
      "Type"        = "Oracle"
    }
  }
]

virtualmachines-ps = [
  {
    hostname        = "vm-svdpsa-0001",
    location        = "West Europe"
    size            = "Standard_D2s_v4",
    offer           = "RHEL",
    publisher       = "RedHat",
    sku             = "8-LVM",
    version         = "latest",
    osdisk_size     = 128,
    create_datadisk = true,
    datadisk_size   = 40,
    zone            = 1
    vm_tags = {
      "CreatedBy"   = "terraform",
      "Environment" = "accept",
      "Project"     = "svdepot"
      "Role"        = "consumer portal",
      "Type"        = "payara server"
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
    destination_address_prefix = "172.18.0.0/28"
  },
  {
    name                       = "AllowSSHfromBastion0003"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    source_address_prefixes    = ["172.20.0.198/32"]
    destination_port_range     = "22"
    destination_address_prefix = "172.18.0.0/28"
  },
  {
    name                       = "AllowCheckMKPing"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_port_range          = "*"
    source_address_prefixes    = ["172.20.0.132/32"]
    destination_port_range     = "*"
    destination_address_prefix = "172.18.0.0/28"
  },
  {
    name                       = "AllowCheckMKPort"
    priority                   = 301
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefixes    = ["172.20.0.132/32"]
    destination_port_range     = "6556"
    destination_address_prefix = "172.18.0.0/28"
  },
  {
    name                       = "AllowSVDBeheerToOEMPort"
    priority                   = 402
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefixes    = ["172.20.1.0/28"]
    destination_port_range     = "1159"
    destination_address_prefix = "172.18.0.0/28"
  },
  {
    name                       = "AllowSVDBeheerToOEMAgentSSLPort"
    priority                   = 403
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefixes    = ["172.20.1.0/28"]
    destination_port_range     = "3872"
    destination_address_prefix = "172.18.0.0/28"
  },
  {
    name                       = "AllowVPNToWLAdminserverPort"
    priority                   = 404
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefixes    = ["172.22.200.0/23"]
    destination_port_range     = "8001-8002"
    destination_address_prefix = "172.18.0.0/28"
  }

]

