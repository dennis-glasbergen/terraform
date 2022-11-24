variable "sec_test_aks_cl1" {
  default = [
    {
      name                  = "AllowExecInToPodsFromVPN"
      protocols             = ["TCP"]
      source_addresses      = ["172.22.200.0/23"]
      destination_addresses = ["172.17.1.0/26"]
      destination_ports     = ["10250"]
    }
  
  ]
}
