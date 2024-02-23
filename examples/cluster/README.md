This example demonstrates orchestrating a cluster composed of multiple namespaces.

## Usage

```hcl
module "eventhubs" {
  source  = "cloudnationhq/evh/azure"
  version = "~> 0.1"

  for_each = local.namespaces

  namespace = each.value
}
```

The module uses a local to iterate, generating a namespace for each key.

```hcl
locals {
  namespaces = {
    prd = {
      name                 = "evhn-demo-prd-001"
      location             = module.rg.groups.demo.location
      resourcegroup        = module.rg.groups.demo.name
      dedicated_cluster_id = module.cluster.instance.id
    }
    dev = {
      name                 = "evhn-demo-dev-001"
      location             = module.rg.groups.demo.location
      resourcegroup        = module.rg.groups.demo.name
      dedicated_cluster_id = module.cluster.instance.id
    }
  }
}
```

The cluster itself can be utilized via a submodule.

```hcl
module "cluster" {
  source = "cloudnationhq/evh/azure/modules/cluster"
  version = "~> 0.1"

  resourcegroup = module.rg.groups.demo.name
  location      = module.rg.groups.demo.location

  cluster = {
    name = "evhc-demo-prd"
    sku  = "Dedicated_1"
  }
}
```
