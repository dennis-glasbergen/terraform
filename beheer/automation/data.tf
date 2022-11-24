data "azurerm_client_config" "current" {
}

data "azurerm_virtual_network" "nw_beheer" {
  name                = "vnet-nw-beheer"
  resource_group_name = "rg-nw-beheer"
}

data "azurerm_subnet" "automation" {
  name                 = "sn-beheer-automation"
  virtual_network_name = "vnet-nw-beheer"
  resource_group_name  = "rg-nw-beheer"
}

#data "azurerm_private_dns_zone" "acr" {
#  name = "privatelink.azurecr.io"
#  resource_group_name = "rg-nw-services"
#}

data "azurerm_role_definition" "kv_cert_officer" {
  name = "Key Vault Certificates Officer"
}

data "azurerm_role_definition" "kv_crypto_officer" {
  name = "Key Vault Crypto Officer"
}

data "azurerm_role_definition" "kv_secrets_officer" {
  name = "Key Vault Secrets Officer"
}
