This example showcases managing event hubs

## Usage

```hcl
module "eventhub" {
  source  = "cloudnationhq/evh/azure"
  version = "~> 0.2"

  naming = local.naming

  namespace = {
    name          = module.naming.eventhub_namespace.name
    location      = module.rg.groups.demo.location
    resourcegroup = module.rg.groups.demo.name

    eventhubs = {
      alerts  = { partition_count = 2, message_retention = 1 }
      metrics = { partition_count = 4, message_retention = 2 }
    }
  }
}
```
