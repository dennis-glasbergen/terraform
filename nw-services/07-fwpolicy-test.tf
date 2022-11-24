resource "azurerm_firewall_policy_rule_collection_group" "test" {
  name               = "${var.rg_prefix}-policy-test"
  firewall_policy_id = azurerm_firewall_policy.policy.id
  priority           = 200

  network_rule_collection {
    name     = "aks-cl1-test"
    priority = 200
   action   = "Allow"

    dynamic "rule" {
      for_each = var.sec_test_aks_cl1
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

