# Consumer Groups

This deploys a eventhub using consumer groups.
For information about consumer groups, see <https://learn.microsoft.com/en-us/azure/event-hubs/event-hubs-features#consumer-groups>

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eventhub"></a> [eventhub](#module\_eventhub) | cloudnationhq/evh/azure | ~> 0.1 |
| <a name="module_naming"></a> [naming](#module\_naming) | cloudnationhq/naming/azure | ~> 0.1 |
| <a name="module_rg"></a> [rg](#module\_rg) | cloudnationhq/rg/azure | ~> 0.1 |

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
  })
})
```

