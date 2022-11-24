
variable "rules" {
  default = [
    {
      name                       = "AllowSSHfromAutomation"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      source_address_prefixes    = ["172.20.0.0/26"]
      destination_port_ranges    = ["22"]
      destination_address_prefix = "172.20.0.128/26"
    },
    {
      name                       = "AllowHTTPsfromVPN"
      priority                   = 101
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      source_address_prefixes    = ["172.22.200.0/23"]
      destination_port_ranges    = ["80", "443", "22"]
      destination_address_prefix = "172.20.0.128/26"
    },
    {
      name                       = "AllowHTTPsfromNets"
      priority                   = 102
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      source_address_prefixes    = ["172.17.0.0/16", "172.18.0.0/16", "172.19.0.0/16", "172.20.0.0/16"]
      destination_port_ranges    = ["443"]
      destination_address_prefix = "172.20.0.128/26"
    }
  ]
}
