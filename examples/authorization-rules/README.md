# Authorization Rules

This deploys a eventhub setting up authorization rules on namespaces.

## Types

```hcl
namespace = object({
  name          = string
  location      = string
  resourcegroup = string

  authorization_rules = optional(map(object({
    name   = optional(string)
    listen = optional(bool, false)
    send   = optional(bool, false)
    manage = optional(bool, false)
  })))
})
```
