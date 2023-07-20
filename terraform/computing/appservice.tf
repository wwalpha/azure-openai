# ----------------------------------------------------------------------------------------------
# Azure Service Plan
# ----------------------------------------------------------------------------------------------
resource "azurerm_service_plan" "this" {
  name                = "srvplan${var.suffix}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  os_type             = "Linux"
  sku_name            = "B1"
}

# ----------------------------------------------------------------------------------------------
# Azure App Service
# ----------------------------------------------------------------------------------------------
resource "azurerm_linux_web_app" "this" {
  name                = "openai${var.suffix}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  service_plan_id     = azurerm_service_plan.this.id

  site_config {}
}
