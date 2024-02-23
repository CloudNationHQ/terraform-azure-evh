output "namespace" {
  description = "contains the eventhub namespace"
  value       = azurerm_eventhub_namespace.ns
}

output "eventhubs" {
  description = "contains all eventhub config"
  value       = azurerm_eventhub.evh
}
