# ----------------------------------------------------------------------------------------------
# Azure Cognitive Search
# ----------------------------------------------------------------------------------------------
resource "azurerm_search_service" "this" {
  name                = "search${var.suffix}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = "basic"
  replica_count       = 1
  partition_count     = 1
}
