# namespace
resource "azurerm_eventhub_namespace" "ns" {
  name                          = var.namespace.name
  resource_group_name           = coalesce(lookup(var.namespace, "resource_group", null), var.resource_group)
  location                      = coalesce(lookup(var.namespace, "location", null), var.location)
  sku                           = try(var.namespace.sku, "Standard")
  capacity                      = try(var.namespace.capacity, 1)
  minimum_tls_version           = try(var.namespace.minimum_tls_version, "1.2")
  auto_inflate_enabled          = try(var.namespace.auto_inflate_enabled, false)
  dedicated_cluster_id          = try(var.namespace.dedicated_cluster_id, null)
  network_rulesets              = try(var.namespace.network_rulesets, [])
  local_authentication_enabled  = try(var.namespace.local_authentication_enabled, false)
  public_network_access_enabled = try(var.namespace.public_network_access_enabled, true)
  tags                          = try(var.namespace.tags, var.tags, null)

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
  resource_group_name = var.namespace.resource_group

  listen = try(each.value.listen, false)
  send   = try(each.value.send, false)
  manage = try(each.value.manage, false)
}

resource "azurerm_eventhub_authorization_rule" "auth" {
  for_each = merge([
    for evh_key, evh in try(var.namespace.eventhubs, {}) :
    lookup(evh, "authorization_rules", null) != null ? {
      for auth_key, auth in evh.authorization_rules : "${evh_key}-${auth_key}" => {
        name     = try(auth.name, join("-", [var.naming.eventhub_authorization_rule, auth_key]))
        evh_key  = evh_key
        auth_key = auth_key
        listen   = try(auth.listen, false)
        send     = try(auth.send, false)
        manage   = try(auth.manage, false)
      }
    } : {}
  ]...)

  name                = each.value.name
  namespace_name      = azurerm_eventhub_namespace.ns.name
  eventhub_name       = azurerm_eventhub.evh[each.value.evh_key].name
  resource_group_name = var.namespace.resource_group

  listen = each.value.listen
  send   = each.value.send
  manage = each.value.manage
}


# eventhubs
resource "azurerm_eventhub" "evh" {
  for_each = try(var.namespace.eventhubs, {})

  name                = try(each.value.name, join("-", [var.naming.eventhub, each.key]))
  resource_group_name = var.namespace.resource_group
  namespace_name      = azurerm_eventhub_namespace.ns.name
  partition_count     = try(each.value.partition_count, 2)
  message_retention   = try(each.value.message_retention, 1)
  status              = try(each.value.status, "Active")
}

# consumer groups
resource "azurerm_eventhub_consumer_group" "cg" {
  for_each = merge([
    for evh_key, evh in try(var.namespace.eventhubs, {}) :
    lookup(evh, "consumer_groups", null) != null ? {
      for cg_key, cg in evh.consumer_groups : "${evh_key}-${cg_key}" => {
        name          = try(cg.name, join("-", [var.naming.eventhub_consumer_group, cg_key]))
        evh_key       = evh_key
        cg_key        = cg_key
        user_metadata = try(cg.user_metadata, null)
      }
    } : {}
  ]...)

  name                = each.value.name
  namespace_name      = azurerm_eventhub_namespace.ns.name
  eventhub_name       = azurerm_eventhub.evh[each.value.evh_key].name
  resource_group_name = var.namespace.resource_group
  user_metadata       = each.value.user_metadata
}
