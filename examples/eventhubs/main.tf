module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.1"

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
  version = "~> 2.0"

  naming = local.naming

  namespace = {
    name           = module.naming.eventhub_namespace.name
    location       = module.rg.groups.demo.location
    resource_group = module.rg.groups.demo.name

    eventhubs = {
      alerts = {
        partition_count   = 2
        message_retention = 1
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
      metrics = {
        partition_count   = 4
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
    }
  }
}
