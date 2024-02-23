module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.1"

  suffix = ["demo", "dev"]
}

module "rg" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 0.1"

  groups = {
    demo = {
      name   = module.naming.resource_group.name
      region = "westeurope"
    }
  }
}

module "eventhub" {
  source  = "cloudnationhq/evh/azure"
  version = "~> 0.1"

  naming = local.naming

  namespace = {
    name          = module.naming.eventhub_namespace.name
    location      = module.rg.groups.demo.location
    resourcegroup = module.rg.groups.demo.name

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
  }
}
