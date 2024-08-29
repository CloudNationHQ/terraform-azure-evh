# Cluster

This deploys a cluster with multiple namespaces.

## Types

```hcl
type = object({
  resource_group = string
  location       = string
  cluster = object({
    name = string
    sku  = string
  })
})
```

## Notes

The cluster, which is optionally configured above one or more namespaces, is managed through a submodule to enhance modularity.
