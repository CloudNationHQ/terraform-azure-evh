# Consumer Groups

This deploys a eventhub using consumer groups.

## Types

```hcl
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
})
```
