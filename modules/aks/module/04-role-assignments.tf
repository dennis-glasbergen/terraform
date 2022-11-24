#resource "azurerm_role_assignment" "ra1" {
#  scope                = azurerm_application_gateway.agw.id
#  role_definition_name = "Contributor"
#  principal_id         = azurerm_user_assigned_identity.uaidentity.principal_id
#}

resource "azurerm_role_assignment" "ra2" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = azurerm_user_assigned_identity.uaidentity.principal_id
}

resource "azurerm_role_assignment" "ra3" {
  scope                = azurerm_user_assigned_identity.uaidentity.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = azurerm_user_assigned_identity.uaidentity.principal_id
}

resource "azurerm_role_assignment" "ra4" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.uaidentity.principal_id
}

resource "azurerm_role_assignment" "ra5" {
  scope                = data.azurerm_private_dns_zone.aks.id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.uaidentity.principal_id
}

resource "azurerm_role_assignment" "ra6" {
  scope                = data.azurerm_virtual_network.nw.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.uaidentity.principal_id
}

resource "azurerm_role_assignment" "ra7" {
  scope                = azurerm_kubernetes_cluster.aks.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.uaidentity.principal_id
}

resource "azurerm_role_assignment" "ra8" {
  scope                = data.azurerm_resource_group.mc.id
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_user_assigned_identity.mc.principal_id

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}

resource "azurerm_role_assignment" "ra9" {
  scope                = azurerm_user_assigned_identity.uaidentity.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = data.azurerm_user_assigned_identity.mc.principal_id

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}

#resource "azurerm_role_assignment" "ra10" {
#  scope                = data.azurerm_route_table.test.id
#  role_definition_name = "Contributor"
#  principal_id         = azurerm_user_assigned_identity.uaidentity.principal_id
#}
