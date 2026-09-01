# namespace
resource "azurerm_eventhub_namespace" "this" {
  resource_group_name = coalesce(
    var.namespace.resource_group_name, var.resource_group_name
  )

  location = coalesce(
    var.namespace.location, var.location
  )

  name                          = var.namespace.name
  sku                           = var.namespace.sku
  capacity                      = var.namespace.capacity
  minimum_tls_version           = var.namespace.minimum_tls_version
  auto_inflate_enabled          = var.namespace.auto_inflate_enabled
  dedicated_cluster_id          = var.namespace.dedicated_cluster_id
  maximum_throughput_units      = var.namespace.maximum_throughput_units
  network_rulesets              = var.namespace.network_rulesets
  local_authentication_enabled  = var.namespace.local_authentication_enabled
  public_network_access_enabled = var.namespace.public_network_access_enabled

  tags = coalesce(
    var.namespace.tags, var.tags
  )

  dynamic "identity" {
    for_each = var.namespace.identity != null ? { "this" = var.namespace.identity } : {}

    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  lifecycle {
    ignore_changes = [
      network_rulesets
    ]
  }
}

# schema groups
resource "azurerm_eventhub_namespace_schema_group" "this" {
  for_each = var.namespace.schema_groups

  name = coalesce(
    each.value.name, each.key
  )

  namespace_id         = azurerm_eventhub_namespace.this.id
  schema_type          = each.value.schema_type
  schema_compatibility = each.value.schema_compatibility
}

# authorization rules
resource "azurerm_eventhub_namespace_authorization_rule" "this" {
  for_each = var.namespace.authorization_rules

  name = coalesce(
    each.value.name, each.key
  )

  namespace_name      = azurerm_eventhub_namespace.this.name
  resource_group_name = var.namespace.resource_group_name

  listen = each.value.listen
  send   = each.value.send
  manage = each.value.manage
}

resource "azurerm_eventhub_authorization_rule" "this" {
  for_each = merge([
    for evh_key, evh in var.namespace.eventhubs : {
      for auth_key, auth in evh.authorization_rules : "${evh_key}-${auth_key}" => {
        evh_key  = evh_key
        auth_key = auth_key
        listen   = auth.listen
        send     = auth.send
        manage   = auth.manage
        name = coalesce(
          auth.name, auth_key
        )
      }
    }
  ]...)

  name                = each.value.name
  namespace_name      = azurerm_eventhub_namespace.this.name
  eventhub_name       = azurerm_eventhub.this[each.value.evh_key].name
  resource_group_name = var.namespace.resource_group_name

  listen = each.value.listen
  send   = each.value.send
  manage = each.value.manage
}


# eventhubs
resource "azurerm_eventhub" "this" {
  for_each = var.namespace.eventhubs

  name = coalesce(
    each.value.name, each.key
  )

  namespace_id = azurerm_eventhub_namespace.this.id

  partition_count   = each.value.partition_count
  message_retention = each.value.retention_description == null ? coalesce(each.value.message_retention, 1) : null
  status            = each.value.status

  dynamic "retention_description" {
    for_each = each.value.retention_description != null ? { "this" = each.value.retention_description } : {}

    content {
      cleanup_policy                    = retention_description.value.cleanup_policy
      retention_time_in_hours           = retention_description.value.retention_time_in_hours
      tombstone_retention_time_in_hours = retention_description.value.tombstone_retention_time_in_hours
    }
  }

  dynamic "capture_description" {
    for_each = each.value.capture_description != null ? { "this" = each.value.capture_description } : {}

    content {
      enabled             = capture_description.value.enabled
      encoding            = capture_description.value.encoding
      interval_in_seconds = capture_description.value.interval_in_seconds
      size_limit_in_bytes = capture_description.value.size_limit_in_bytes
      skip_empty_archives = capture_description.value.skip_empty_archives

      destination {
        name                        = capture_description.value.destination.name
        archive_name_format         = capture_description.value.destination.archive_name_format
        blob_container_name         = capture_description.value.destination.blob_container_name
        storage_account_id          = capture_description.value.destination.storage_account_id
        storage_authentication_id   = capture_description.value.destination.storage_authentication_id
        storage_authentication_type = capture_description.value.destination.storage_authentication_type
      }
    }
  }
}

# consumer groups
resource "azurerm_eventhub_consumer_group" "this" {
  for_each = merge([
    for evh_key, evh in var.namespace.eventhubs : {
      for cg_key, cg in evh.consumer_groups : "${evh_key}-${cg_key}" => {
        evh_key       = evh_key
        cg_key        = cg_key
        user_metadata = cg.user_metadata
        name = coalesce(
          cg.name, cg_key
        )
      }
    }
  ]...)

  name                = each.value.name
  namespace_name      = azurerm_eventhub_namespace.this.name
  eventhub_name       = azurerm_eventhub.this[each.value.evh_key].name
  resource_group_name = var.namespace.resource_group_name
  user_metadata       = each.value.user_metadata
}
