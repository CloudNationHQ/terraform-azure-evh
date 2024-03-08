locals {
  naming = {
    # lookup outputs to have consistent naming
    for type in local.naming_types : type => lookup(module.naming, type).name
  }

  naming_types = ["eventhub", "eventhub_consumer_group"]
}

locals {
  eventhubs = {
    datahub = {
      partition_count   = 2,
      message_retention = 1,
      consumer_groups = {
        users = {
          user_metadata = "user_events"
        },
        metrics = {
          user_metadata = "system_metrics"
        }
      }
    }
  }
  schema_groups = {
    trafficsensor = {
      schema_type          = "Avro",
      schema_compatibility = "Forward"
    }
  }
  authorization_rules = {
    users = {
      listen = true
    }
    admins = {
      listen = true
      send   = true
      manage = true
    }
  }
}
