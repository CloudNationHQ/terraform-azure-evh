moved {
  from = azurerm_eventhub_namespace.ns
  to   = azurerm_eventhub_namespace.this
}

moved {
  from = azurerm_eventhub_namespace_schema_group.sg
  to   = azurerm_eventhub_namespace_schema_group.this
}

moved {
  from = azurerm_eventhub_namespace_authorization_rule.auth
  to   = azurerm_eventhub_namespace_authorization_rule.this
}

moved {
  from = azurerm_eventhub_authorization_rule.auth
  to   = azurerm_eventhub_authorization_rule.this
}

moved {
  from = azurerm_eventhub.evh
  to   = azurerm_eventhub.this
}

moved {
  from = azurerm_eventhub_consumer_group.cg
  to   = azurerm_eventhub_consumer_group.this
}
