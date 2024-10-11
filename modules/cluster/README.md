# Eventhub Cluster

This submodule demonstrates managing event hub clusters

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_eventhub_cluster.cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster"></a> [cluster](#input\_cluster) | contains the cluster configuration | `map(any)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | contains the region | `string` | `null` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | contains the resourcegroup name | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance"></a> [instance](#output\_instance) | contains the cluster configuration |
<!-- END_TF_DOCS -->
