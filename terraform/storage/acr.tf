# ----------------------------------------------------------------------------------------------
# Azure Container Registry
# ----------------------------------------------------------------------------------------------
resource "azurerm_container_registry" "this" {
  name                          = "openai${var.suffix}"
  resource_group_name           = var.resource_group_name
  location                      = var.resource_group_location
  sku                           = "Basic"
  admin_enabled                 = false
  public_network_access_enabled = true
  anonymous_pull_enabled        = false
}
