# Event Hubs

This deploys one or more event hubs

## Types

```hcl
namespace = object({
  name          = string
  location      = string
  resourcegroup = string

  eventhubs = optional(map(object({
    partition_count   = number
    message_retention = number
  })))
})
```