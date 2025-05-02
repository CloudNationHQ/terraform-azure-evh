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

  namespace = {
    name           = module.naming.eventhub_namespace.name_unique
    location       = module.rg.groups.demo.location
    resource_group = module.rg.groups.demo.name

    schema_groups = {
      trafficsensor = {
        schema_type          = "Avro",
        schema_compatibility = "Forward"
      }
    }
  }
}
