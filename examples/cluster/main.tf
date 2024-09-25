module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.1"

  suffix = ["demo", "prd"]
}

module "rg" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 2.0"

  groups = {
    demo = {
      name     = module.naming.resource_group.name
      location = "westeurope"
    }
  }
}

module "eventhubs" {
  source  = "cloudnationhq/evh/azure"
  version = "~> 2.0"

  for_each = local.namespaces

  namespace = each.value
}

module "cluster" {
  source  = "cloudnationhq/evh/azure/modules/cluster"
  version = "~> 2.0"

  resource_group = module.rg.groups.demo.name
  location       = module.rg.groups.demo.location

  cluster = {
    name = "evhc-demo-dev"
    sku  = "Dedicated_1"
  }
}
