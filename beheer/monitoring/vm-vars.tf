variable "virtualmachines" {
  type = list(object({
    hostname    = string
    size        = string
    offer       = string
    publisher   = string
    sku         = string
    version     = string
    osdisk_size = number
  }))
  default = [
    {
      hostname    = "vm-beheer-0001",
      size        = "Standard_DS2_v2",
      offer       = "RHEL",
      publisher   = "RedHat",
      sku         = "8-LVM",
      version     = "8.3.2020111909",
      osdisk_size = 128
    }
  ]
}
