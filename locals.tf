locals {
  consumer_groups = flatten([
    for evh_key, evh in try(var.namespace.eventhubs, {}) : [
      for cg_key, cg in try(evh.consumer_groups, {}) : {
        key           = "${evh_key}.${cg_key}"
        evh_name      = azurerm_eventhub.evh[evh_key].name
        name          = try(cg.name, join("-", [var.naming.eventhub_consumer_group, cg_key]))
        user_metadata = try(cg.user_metadata, null)
      }
    ]
  ])

  eventhub_authorization_rules = flatten([
    for evh_key, evh in try(var.namespace.eventhubs, {}) : [
      for auth_key, auth in try(evh.authorization_rules, {}) : {
        key      = "${evh_key}.${auth_key}"
        name     = try(auth.name, join("-", [var.naming.eventhub_authorization_rule, auth_key]))
        evh_name = azurerm_eventhub.evh[evh_key].name
        listen   = try(auth.listen, false)
        send     = try(auth.send, false)
        manage   = try(auth.manage, false)
      }
  ]])
}
