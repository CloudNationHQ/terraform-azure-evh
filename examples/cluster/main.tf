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

module "eventhubs" {
  #source  = "cloudnationhq/evh/azure"
  #version = "~> 0.1"
  source = "../.."

  for_each = local.namespaces

  namespace = each.value
}

module "eventhub_cluster" {
  source = "../../modules/cluster"

  resourcegroup = module.rg.groups.demo.name
  location      = module.rg.groups.demo.location

  cluster = {
    name = "evhc-demo-prd"
    sku  = "Dedicated_1"
  }
}
