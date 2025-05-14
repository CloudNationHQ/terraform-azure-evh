module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.24"

  suffix = ["demo", "dev"]
}

module "rg" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 2.0"

  groups = {
    demo = {
      name     = module.naming.resource_group.name_unique
      location = "westeurope"
    }
  }
}

module "eventhub" {
  source  = "cloudnationhq/evh/azure"
  version = "~> 3.0"

  naming = local.naming

  namespace = {
    name                = module.naming.eventhub_namespace.name_unique
    location            = module.rg.groups.demo.location
    resource_group_name = module.rg.groups.demo.name
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
}
