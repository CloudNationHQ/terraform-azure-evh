This example illustrates setting up authorization rules on namespaces.

## Usage

```hcl
module "eventhub" {
  source  = "cloudnationhq/evh/azure"
  version = "~> 0.1"

  naming = local.naming

  namespace = {
    name          = module.naming.eventhub_namespace.name
    location      = module.rg.groups.demo.location
    resourcegroup = module.rg.groups.demo.name

    authorization_rules = {
      users = {
        listen = true
      }
      admins = {
        listen = true
        send   = true
        manage = true
      }
    }
  }
}
```
