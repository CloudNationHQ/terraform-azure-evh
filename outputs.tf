output "namespace" {
  description = "contains all namespace config"
  value       = azurerm_eventhub_namespace.ns
}

output "eventhubs" {
  description = "contains all eventhub config"
  value       = azurerm_eventhub.evh
}
