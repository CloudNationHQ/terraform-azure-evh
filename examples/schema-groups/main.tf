module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.1"

  suffix = ["demo", "prd"]
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

  namespace = {
    name          = module.naming.eventhub_namespace.name
    location      = module.rg.groups.demo.location
    resourcegroup = module.rg.groups.demo.name

    schema_groups = {
      trafficsensor = {
        schema_type          = "Avro",
        schema_compatibility = "Forward"
      }
    }
  }
}
