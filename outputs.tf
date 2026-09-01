output "namespace" {
  description = "contains all namespace config"
  value       = azurerm_eventhub_namespace.this
}

output "eventhubs" {
  description = "contains all eventhub config"
  value       = azurerm_eventhub.this
}

output "namespace_authorization_rules" {
  description = "contains all namespace authorization rule config"
  value       = azurerm_eventhub_namespace_authorization_rule.this
}

output "authorization_rules" {
  description = "contains all eventhub authorization rule config"
  value       = azurerm_eventhub_authorization_rule.this
}

output "consumer_groups" {
  description = "contains all eventhub consumer group config"
  value       = azurerm_eventhub_consumer_group.this
}

output "schema_groups" {
  description = "contains all namespace schema group config"
  value       = azurerm_eventhub_namespace_schema_group.this
}
