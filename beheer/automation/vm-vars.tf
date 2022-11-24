variable "virtualmachines" {
  type = list(object({
    hostname        = string
    size            = string
    offer           = string
    publisher       = string
    sku             = string
    version         = string
    osdisk_size     = number
    create_datadisk = bool
    datadisk_size   = number
    zone            = number
  }))
  default = [
    {
      hostname        = "vm-atmt-0001",
      size            = "Standard_DS2_v2",
      offer           = "RHEL",
      publisher       = "RedHat",
      sku             = "8-LVM",
      version         = "latest",
      osdisk_size     = 128,
      create_datadisk = false,
      datadisk_size   = 0,
      zone            = 1
    }
  ]
}
