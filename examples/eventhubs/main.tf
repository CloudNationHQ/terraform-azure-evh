module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.26"

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
  source = "../.."

  naming = local.naming

  namespace = {
    name                = module.naming.eventhub_namespace.name_unique
    location            = module.rg.groups.demo.location
    resource_group_name = module.rg.groups.demo.name

    eventhubs = {
      alerts = {
        partition_count   = 2
        message_retention = 2
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
      defaults = {
        partition_count = 2
      }
      retention-delete = {
        partition_count = 2
        retention_description = {
          cleanup_policy          = "Delete"
          retention_time_in_hours = 168
        }
      }
      retention-compact = {
        partition_count = 2
        retention_description = {
          cleanup_policy                    = "Compact"
          tombstone_retention_time_in_hours = 24
        }
      }
      metrics = {
        partition_count   = 4
        message_retention = 3
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
  }
}
