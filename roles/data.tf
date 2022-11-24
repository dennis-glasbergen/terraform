data "azurerm_client_config" "current" {
}

#data "azurerm_key_vault" "kv_beheer_automation" {
#  name                = "automation-kv-0001"
#  resource_group_name = "rg-beheer-automation"
#}

data "azurerm_storage_container" "terraform_prod" {
  name                = "stateprod"
  storage_account_name = "saterraformprod0001"
 }