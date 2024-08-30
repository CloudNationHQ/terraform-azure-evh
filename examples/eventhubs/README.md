# Event Hubs

This deploys one or more event hubs

## Types

```hcl
namespace = object({
  name           = string
  location       = string
  resource_group = string

  eventhubs = optional(map(object({
    partition_count   = number
    message_retention = number
    authorization_rules = optional(map(object({
      name   = optional(string)
      listen = optional(bool, false)
      send   = optional(bool, false)
      manage = optional(bool, false)
    })))
  })))
})
```
