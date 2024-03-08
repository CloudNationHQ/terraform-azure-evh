This example illustrates managing schema groups within event hub namespaces.

## Usage

```hcl
module "eventhub" {
  source  = "cloudnationhq/evh/azure"
  version = "~> 0.2"

  namespace = {
    name          = module.naming.eventhub_namespace.name
    location      = module.rg.groups.demo.location
    resourcegroup = module.rg.groups.demo.name

    schema_groups = {
      trafficsensor = {
        schema_type          = "Avro",
        schema_compatibility = "Forward"
      }
    }
  }
}
```
