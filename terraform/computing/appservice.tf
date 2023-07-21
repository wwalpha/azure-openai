# ----------------------------------------------------------------------------------------------
# Azure Service Plan
# ----------------------------------------------------------------------------------------------
resource "azurerm_service_plan" "this" {
  name                = "freeplan-${var.suffix}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  os_type             = "Linux"
  sku_name            = "F1"
}

# ----------------------------------------------------------------------------------------------
# Azure App Service
# ----------------------------------------------------------------------------------------------
resource "azurerm_linux_web_app" "this" {
  name                = "app-${var.suffix}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  service_plan_id     = azurerm_service_plan.this.id

  site_config {}
}

# ----------------------------------------------------------------------------------------------
# Azure Static Web App
# ----------------------------------------------------------------------------------------------
resource "azurerm_static_site" "this" {
  name                = "spa-${var.suffix}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
}
