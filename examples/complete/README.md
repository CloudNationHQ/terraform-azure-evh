This example highlights the complete usage.

## Usage

```hcl
module "eventhub" {
  source  = "cloudnationhq/evh/azure"
  version = "~> 0.1"

  naming = local.naming

  namespace = {
    name          = module.naming.eventhub_namespace.name
    location      = module.rg.groups.demo.location
    resourcegroup = module.rg.groups.demo.name

    schema_groups = local.schema_groups
    eventhubs     = local.eventhubs
  }
}
```

The module uses the below locals for configuration:

```hcl
locals {
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
  schema_groups = {
    trafficsensor = {
      schema_type          = "Avro",
      schema_compatibility = "Forward"
    }
  }
}
```
