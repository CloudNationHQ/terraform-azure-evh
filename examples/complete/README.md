# Complete

This example highlights the complete usage.

## Types

```hcl
type = object({
  namespace = object({
    name          = string
    location      = string
    resourcegroup = string

    eventhubs = optional(map(object({
      partition_count   = number
      message_retention = number
      consumer_groups = optional(map(object({
        user_metadata = string
      })))
    })))

    schema_groups = optional(map(object({
      schema_type          = string
      schema_compatibility = string
    })))

    authorization_rules = optional(map(object({
      name   = optional(string)
      listen = optional(bool, false)
      send   = optional(bool, false)
      manage = optional(bool, false)
    })))
  })
})
```
