# Create Firewall policy rule for group Beheer
resource "azurerm_firewall_policy_rule_collection_group" "beheer" {
  name               = "${var.rg_prefix}-policy-beheer"
  firewall_policy_id = azurerm_firewall_policy.policy.id
  priority           = 100

  network_rule_collection {
    name     = "beheer_monitoring"
    priority = 100
   action   = "Allow"

    dynamic "rule" {
      for_each = var.beheer-monitoring-rules
      content {
        name                  = rule.value.name
        protocols             = rule.value.protocols
        source_addresses      = rule.value.source_addresses
        destination_addresses = rule.value.destination_addresses
        destination_ports     = rule.value.destination_ports
      }
    }
  }



  depends_on = [
    azurerm_firewall_policy.policy
  ]

}