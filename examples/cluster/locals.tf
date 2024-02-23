locals {
  namespaces = {
    ns1 = {
      name                 = "evhn-demo-dev-001"
      location             = module.rg.groups.demo.location
      resourcegroup        = module.rg.groups.demo.name
      dedicated_cluster_id = module.cluster.instance.id
    }
    ns2 = {
      name                 = "evhn-demo-dev-002"
      location             = module.rg.groups.demo.location
      resourcegroup        = module.rg.groups.demo.name
      dedicated_cluster_id = module.cluster.instance.id
    }
  }
}
