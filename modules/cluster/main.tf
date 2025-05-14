# cluster
resource "azurerm_eventhub_cluster" "cluster" {
  name                = var.cluster.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.cluster.sku

  tags = try(
    var.cluster.tags, {}
  )
}
