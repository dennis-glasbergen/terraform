# Create Storage account for Audit logs
resource "azurerm_storage_account" "sqlaudit" {
  name                     = "sa${replace(var.rg_prefix, "-", "")}0001au"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_kind             = "BlobStorage"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  tags = var.tags
}


# Create SQL server
resource "azurerm_sql_server" "dadpdb" {
  name                         = "sql-${var.rg_prefix}-0001"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "admin_dba"
  administrator_login_password = "welkom@1234!"

  tags = var.tags
}

