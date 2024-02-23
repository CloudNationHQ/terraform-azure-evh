# namespace
resource "azurerm_eventhub_namespace" "ns" {
  name                = var.namespace.name
  location            = var.namespace.location
  resource_group_name = var.namespace.resourcegroup

  sku                           = try(var.namespace.sku, "Standard")
  capacity                      = try(var.namespace.capacity, 1)
  zone_redundant                = try(var.namespace.zone_redundant, false)
  minimum_tls_version           = try(var.namespace.minimum_tls_version, "1.2")
  auto_inflate_enabled          = try(var.namespace.auto_inflate_enabled, false)
  dedicated_cluster_id          = try(var.namespace.dedicated_cluster_id, null)
  network_rulesets              = try(var.namespace.network_rulesets, [])
  local_authentication_enabled  = try(var.namespace.local_authentication_enabled, false)
  public_network_access_enabled = try(var.namespace.public_network_access_enabled, true)
  tags                          = try(var.namespace.tags, {})

  lifecycle {
    ignore_changes = [
      network_rulesets
    ]
  }
}

# schema groups
resource "azurerm_eventhub_namespace_schema_group" "sg" {
  for_each = try(var.namespace.schema_groups, {})

  name                 = try(each.value.name, each.key)
  namespace_id         = azurerm_eventhub_namespace.ns.id
  schema_type          = try(each.value.schema_type, "Avro")
  schema_compatibility = try(each.value.schema_compatibility, "Forward")
}

# authorization rules
resource "azurerm_eventhub_namespace_authorization_rule" "auth" {
  for_each = try(var.namespace.authorization_rules, {})

  name                = try(each.value.name, join("-", [var.naming.eventhub_namespace_authorization_rule, each.key]))
  namespace_name      = azurerm_eventhub_namespace.ns.name
  resource_group_name = var.namespace.resourcegroup

  listen = try(each.value.listen, false)
  send   = try(each.value.send, false)
  manage = try(each.value.manage, false)
}

# eventhubs
resource "azurerm_eventhub" "evh" {
  for_each = try(var.namespace.eventhubs, {})

  name                = try(each.value.name, join("-", [var.naming.eventhub, each.key]))
  resource_group_name = var.namespace.resourcegroup
  namespace_name      = azurerm_eventhub_namespace.ns.name
  partition_count     = try(each.value.partition_count, 2)
  message_retention   = try(each.value.message_retention, 1)
  status              = try(each.value.status, "Active")
}

# consumer groups
resource "azurerm_eventhub_consumer_group" "cg" {
  for_each = {
    for cg in local.consumer_groups : "${cg.evh_key}.${cg.cg_key}" => cg
  }

  name                = each.value.name
  namespace_name      = azurerm_eventhub_namespace.ns.name
  eventhub_name       = azurerm_eventhub.evh[each.value.evh_key].name
  resource_group_name = var.namespace.resourcegroup
  user_metadata       = each.value.user_metadata
}
