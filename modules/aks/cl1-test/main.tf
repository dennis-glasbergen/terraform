module "aks-test-cl1" {
  # Module source
  source = "../module"

  # Prefix for the AKS cluster
  rg_prefix         = "test-aks-cl1"
  rg_prefix_short   = "test-cl1"
  rg_cluster_prefix = "cl1"

  # Prefix for networking resources (from nw-networking module)
  rg_nw_prefix       = "nw-test"
  rg_nw_prefix_short = "test"

  # Default parameters for deployment 
  location            = "West Europe"
  vm_user_name        = "deploy_infra"
  public_ssh_key_path = "../../../keys/id_rsa_deploy_infra.pub"

  # Tags
  tags = {
    "CreatedBy"    = "terraform",
    "Environment"  = "test",
    "Subscription" = "sandbox"
    "Project"      = "AKS Cluster1 Test"
  }

  # Azure AD group for cluster-admin access
  infra_aad_group = "Infrastructure Team"

  # AKS Parameters
  aks_agent_os_disk_size = 128
  aks_agent_min_count    = 3
  aks_agent_max_count    = 10
  aks_agent_node_count   = 3
  aks_agent_vm_size      = "Standard_D2s_v3"
  kubernetes_version     = "1.19.9"
  ## Use second IP number as cluster identifier, so cl1 = 10.1, cl2 is 10.2, etc.
  ## This is needed to prevent issues within the route table to the firewall
  aks_service_cidr   = "10.1.0.0/16"
  aks_dns_service_ip = "10.1.0.10"
  ## For pod networkgin, cl1 = 10.11, cl2 = 10.12, etc.
  aks_pod_cidr = "10.11.0.0/16"
  ## For docker bridge network, cl1 = 10.101, cl2 = 10.102, etc. 
  aks_docker_bridge_cidr  = "10.101.0.1/16"
  aks_enable_rbac         = true
  private_cluster_enabled = true

  rules = [
    {
      name                       = "AllowHTTPAccesToInternalLB"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      source_address_prefix      = "172.22.200.0/23"
      destination_port_range     = "80"
      destination_address_prefix = "172.17.1.8"
    },
    {
      name                       = "AllowHTTPsAccesToInternalLB"
      priority                   = 101
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      source_address_prefix      = "172.22.200.0/23"
      destination_port_range     = "443"
      destination_address_prefix = "172.17.1.8"
    },
    {
      name                       = "AllowHaproxyAccesToInternalLB"
      priority                   = 102
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      source_address_prefix      = "172.22.200.0/23"
      destination_port_range     = "1024"
      destination_address_prefix = "172.17.1.8"
    },
    {
      name                       = "AllowHTTPAccesToExternallLB"
      priority                   = 103
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      source_address_prefix      = "80.56.62.190/32"
      destination_port_range     = "80"
      destination_address_prefix = "52.157.218.240"
    },
    {
      name                       = "AllowHTTPsAccesToExternalLB"
      priority                   = 104
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      source_address_prefix      = "80.56.62.190/32"
      destination_port_range     = "443"
      destination_address_prefix = "52.157.218.240"
    },
    {
      name                       = "AllowHaproxyAccesToExternalLB"
      priority                   = 105
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      source_address_prefix      = "80.56.62.190/32"
      destination_port_range     = "1024"
      destination_address_prefix = "52.157.218.240"
    },
    {
      name                       = "AllowAzureLoadbalancer"
      priority                   = 4094
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      source_address_prefix      = "AzureLoadbalancer"
      destination_port_range     = "*"
      destination_address_prefix = "172.17.1.0/26"
    },
    {
      name                       = "AllowSubnetTraffic"
      priority                   = 4095
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      source_address_prefix      = "172.17.1.0/26"
      destination_port_range     = "*"
      destination_address_prefix = "172.17.1.0/26"
    }
  ]

}
