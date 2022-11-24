# Rules for firewall dynamic block Monitor
variable "beheer-monitoring-rules" {
  default = [
    {
      name                  = "AllowSSHfromVPN"
      protocols             = ["TCP"]
      source_addresses      = ["172.22.200.0/23"]
      destination_addresses = ["172.20.0.128/26"]
      destination_ports     = ["22"]
    },
    {
      name                  = "AllowHTTPsFromVPN"
      protocols             = ["TCP"]
      source_addresses      = ["172.22.200.0/23"]
      destination_addresses = ["172.20.0.128/26"]
      destination_ports     = ["80", "443"]
    }
  ]
}
