locals {
  namespaces = {
    prd = {
      name                 = "evhn-demo-prd-001"
      location             = module.rg.groups.demo.location
      resourcegroup        = module.rg.groups.demo.name
      dedicated_cluster_id = module.eventhub_cluster.cluster.id
    }
    dev = {
      name                 = "evhn-demo-dev-001"
      location             = module.rg.groups.demo.location
      resourcegroup        = module.rg.groups.demo.name
      dedicated_cluster_id = module.eventhub_cluster.cluster.id
    }
  }
}
