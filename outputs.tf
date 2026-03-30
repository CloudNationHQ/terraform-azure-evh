output "namespace" {
  description = "contains all namespace config"
  value       = azurerm_eventhub_namespace.ns
}

output "eventhubs" {
  description = "contains all eventhub config"
  value       = azurerm_eventhub.evh
}

output "namespace_authorization_rules" {
  description = "contains all namespace authorization rule config"
  value       = azurerm_eventhub_namespace_authorization_rule.auth
}

output "authorization_rules" {
  description = "contains all eventhub authorization rule config"
  value       = azurerm_eventhub_authorization_rule.auth
}

output "consumer_groups" {
  description = "contains all eventhub consumer group config"
  value       = azurerm_eventhub_consumer_group.cg
}

output "schema_groups" {
  description = "contains all namespace schema group config"
  value       = azurerm_eventhub_namespace_schema_group.sg
}
