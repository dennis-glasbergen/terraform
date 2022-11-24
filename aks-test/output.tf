output "routeoptions" {
  value = data.azurerm_route_table.aks_route
  #value = data.azurerm_resources.routetable.name
}
