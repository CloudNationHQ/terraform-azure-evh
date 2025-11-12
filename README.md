# Eventhubs

This Terraform module facilitates the setup and management of event hub resources on azure, providing flexible configurations for namespace creation and event hub instances. It ensures a robust and scalable messaging platform in the cloud, designed to handle massive amounts of event data in real-time.

## Features

Simplifies managing multiple event hubs.

Supports multiple schema groups for consistent event data structuring.

Streamlines setup of multiple consumer groups.

Enables clustering with multiple namespaces.

Supports setting up various authorization rules for detailed access control.

Utilization of terratest for robust validation.

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 4.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (~> 4.0)

## Resources

The following resources are used by this module:

- [azurerm_eventhub.evh](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) (resource)
- [azurerm_eventhub_authorization_rule.auth](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_authorization_rule) (resource)
- [azurerm_eventhub_consumer_group.cg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_consumer_group) (resource)
- [azurerm_eventhub_namespace.ns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace) (resource)
- [azurerm_eventhub_namespace_authorization_rule.auth](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace_authorization_rule) (resource)
- [azurerm_eventhub_namespace_schema_group.sg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace_schema_group) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_namespace"></a> [namespace](#input\_namespace)

Description: Contains all eventhub configuration

Type:

```hcl
object({
    name                          = string
    resource_group_name           = optional(string)
    location                      = optional(string)
    sku                           = optional(string, "Standard")
    capacity                      = optional(number, 1)
    minimum_tls_version           = optional(string, "1.2")
    auto_inflate_enabled          = optional(bool, false)
    dedicated_cluster_id          = optional(string)
    maximum_throughput_units      = optional(number)
    network_rulesets              = optional(list(any), [])
    local_authentication_enabled  = optional(bool, false)
    public_network_access_enabled = optional(bool, true)
    tags                          = optional(map(string))
    identity = optional(object({
      type         = optional(string, "SystemAssigned")
      identity_ids = optional(list(string))
    }), null)
    schema_groups = optional(map(object({
      name                 = optional(string)
      schema_type          = optional(string, "Avro")
      schema_compatibility = optional(string, "Forward")
    })), {})
    authorization_rules = optional(map(object({
      name   = optional(string)
      listen = optional(bool, false)
      send   = optional(bool, false)
      manage = optional(bool, false)
    })), {})
    eventhubs = optional(map(object({
      name              = optional(string)
      partition_count   = optional(number, 2)
      message_retention = optional(number, 1)
      status            = optional(string, "Active")
      capture_description = optional(object({
        enabled             = bool
        encoding            = string
        interval_in_seconds = optional(number, 300)
        size_limit_in_bytes = optional(number, 314572800)
        skip_empty_archives = optional(bool, false)
        destination = object({
          archive_name_format = string
          blob_container_name = string
          storage_account_id  = string
        })
      }), null)
      authorization_rules = optional(map(object({
        name   = optional(string)
        listen = optional(bool, false)
        send   = optional(bool, false)
        manage = optional(bool, false)
      })), {})
      consumer_groups = optional(map(object({
        name          = optional(string)
        user_metadata = optional(string)
      })), {})
    })), {})
  })
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_location"></a> [location](#input\_location)

Description: default azure region to be used.

Type: `string`

Default: `null`

### <a name="input_naming"></a> [naming](#input\_naming)

Description: contains naming convention

Type: `map(string)`

Default: `{}`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: default resource group to be used.

Type: `string`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: tags to be added to the resources

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_eventhubs"></a> [eventhubs](#output\_eventhubs)

Description: contains all eventhub config

### <a name="output_namespace"></a> [namespace](#output\_namespace)

Description: contains all namespace config
<!-- END_TF_DOCS -->

## Goals

For more information, please see our [goals and non-goals](./GOALS.md).

## Testing

For more information, please see our testing [guidelines](./TESTING.md)

## Notes

Using a dedicated module, we've developed a naming convention for resources that's based on specific regular expressions for each type, ensuring correct abbreviations and offering flexibility with multiple prefixes and suffixes.

Full examples detailing all usages, along with integrations with dependency modules, are located in the examples directory.

To update the module's documentation run `make doc`

## Contributors

We welcome contributions from the community! Whether it's reporting a bug, suggesting a new feature, or submitting a pull request, your input is highly valued.

For more information, please see our contribution [guidelines](./CONTRIBUTING.md). <br><br>

<a href="https://github.com/cloudnationhq/terraform-azure-evh/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=cloudnationhq/terraform-azure-evh" />
</a>


## License

MIT Licensed. See [LICENSE](./LICENSE) for full details.

## References

- [Documentation](https://learn.microsoft.com/en-us/azure/event-hubs/)
- [Rest Api](https://learn.microsoft.com/en-us/rest/api/eventhub/)
- [Rest Api Specs](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/eventhub/resource-manager/Microsoft.EventHub/stable/2024-01-01)
