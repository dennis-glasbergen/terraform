
variable "rules" {
  default = [
    {
      name                       = "AllowSSHfromVPN"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      source_address_prefixes    = ["172.22.200.0/23"]
      destination_port_range     = "22"
      destination_address_prefix = "172.20.0.0/26"
    },
    {
      name                       = "AllowSSHWithinSubnet"
      priority                   = 101
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      source_address_prefixes    = ["172.20.0.0/26"]
      destination_port_range     = "22"
      destination_address_prefix = "172.20.0.0/26"
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
      destination_address_prefix = "172.20.0.0/26"
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
      destination_address_prefix = "172.20.0.0/26"
    },
    {
      name                       = "AllowHTTPsToNetboxFromVPN"
      priority                   = 1000
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      source_address_prefixes    = ["172.22.200.0/23"]
      destination_port_range     = "443"
      destination_address_prefix = "172.20.0.5/32"
    },
    {
      name                       = "AllowHTTPsToNetboxFromAnsible"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      source_address_prefixes    = ["172.20.0.4/32"]
      destination_port_range     = "443"
      destination_address_prefix = "172.20.0.5/32"
    },
    {
      name                       = "AllowHTTPToExalateFromVPN"
      priority                   = 1002
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      source_address_prefixes    = ["172.22.200.0/23"]
      destination_port_range     = "9000"
      destination_address_prefix = "172.20.0.6/32"
    }
  ]
}

