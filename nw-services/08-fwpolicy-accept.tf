#resource "azurerm_firewall_policy_rule_collection_group" "accept" {
#  name               = "${var.rg_prefix}-policy-accept"
#  firewall_policy_id = azurerm_firewall_policy.policy.id
#  priority           = 300

#  network_rule_collection {
#    name     = "svd-accept-weblogic"
#    priority = 300
#    action   = "Allow"

#    dynamic "rule" {
 #     for_each = var.sec_accept
 #     content {
 #       name                  = rule.value.name
 #       protocols             = rule.value.protocols
 #       source_addresses      = rule.value.source_addresses
 #       destination_addresses = rule.value.destination_addresses
 #       destination_ports     = rule.value.destination_ports
 #     }
 #   }
 # }

#  depends_on = [
#    azurerm_firewall_policy.policy
#  ]

#}