locals {
  naming = {
    # lookup outputs to have consistent naming
    for type in local.naming_types : type => lookup(module.naming, type).name
  }

  naming_types = ["eventhub", "eventhub_consumer_group", "eventhub_namespace_authorization_rule", "eventhub_authorization_rule"]
}
