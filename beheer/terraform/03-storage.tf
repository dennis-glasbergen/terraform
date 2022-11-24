# Create Storage Account for Terraform Productie
resource "azurerm_storage_account" "storageterraformprod" {
  name                     = "sa${replace(var.rg_prefix_short, "-", "")}prod0001"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"

  tags = var.tags
}

# Create Container Terraform Prod
resource "azurerm_storage_container" "terraform_prod" {
  name                  = "stateprod"
  storage_account_name  = azurerm_storage_account.storageterraformprod.name
  container_access_type = "private"
}




# Create Storage Account for Terraform Accept
resource "azurerm_storage_account" "storageterraformaccept" {
  name                     = "sa${replace(var.rg_prefix_short, "-", "")}accept0001"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"

  tags = var.tags
}

# Create Container Terraform Accpet
resource "azurerm_storage_container" "terraform_accept" {
  name                  = "stateaccept"
  storage_account_name  = azurerm_storage_account.storageterraformaccept.name
  container_access_type = "private"
}


# Create Storage Account for Terraform Test
resource "azurerm_storage_account" "storageterraformtest" {
  name                     = "sa${replace(var.rg_prefix_short, "-", "")}test0001"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"

  tags = var.tags
}

# Create Container Terraform Test
resource "azurerm_storage_container" "terraform_test" {
  name                  = "statetest"
  storage_account_name  = azurerm_storage_account.storageterraformtest.name
  container_access_type = "private"
}