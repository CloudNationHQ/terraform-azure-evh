# Schema Groups

This deploys schema groups within namespaces

## Types

```hcl
namespace = object({
  name          = string
  location      = string
  resourcegroup = string

  schema_groups = optional(map(object({
    schema_type          = string
    schema_compatibility = string
  })))
})
```
