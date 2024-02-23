locals {
  consumer_groups = flatten([
    for evh_key, evh in try(var.namespace.eventhubs, {}) : [
      for cg_key, cg in try(evh.consumer_groups, {}) : {
        evh_key       = evh_key
        cg_key        = cg_key
        name          = try(cg.name, join("-", [var.naming.eventhub_consumer_group, cg_key]))
        user_metadata = try(cg.user_metadata, null)
      }
    ]
  ])
}
