This example illustrates the default eventhub namespace setup, in its simplest form.

## Usage

```hcl
module "eventhub" {
  source  = "cloudnationhq/evh/azure"
  version = "~> 0.2"

  namespace = {
    name          = module.naming.eventhub_namespace.name
    location      = module.rg.groups.demo.location
    resourcegroup = module.rg.groups.demo.name
  }
}
```
