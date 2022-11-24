


# Add Storage Blob Data Contributor for Infra Team group to storage 
resource "azurerm_role_assignment" "infra_admins_storage_blob_data_contributor" {
  scope              = data.azurerm_storage_container.terraform_prod.id
  role_definition_id = data.azurerm_role_definition.storage_blob_data_contributor.id
  principal_id       = azuread_group.infra_group.object_id

  # Added this to prevent recreation
  lifecycle {
    ignore_changes = [
      role_definition_id
    ]
  }
}