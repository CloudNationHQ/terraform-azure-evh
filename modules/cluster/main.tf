# cluster
resource "azurerm_eventhub_cluster" "this" {
  name                = var.cluster.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.cluster.sku

  tags = coalesce(
    var.cluster.tags, var.tags
  )
}
