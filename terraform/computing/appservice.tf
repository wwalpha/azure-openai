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
  https_only          = true

  site_config {
    always_on           = false
    minimum_tls_version = 1.2
  }

  app_settings = {
    DOCKER_REGISTRY_SERVER_URL      = var.acr_login_server
    DOCKER_REGISTRY_SERVER_USERNAME = var.acr_admin_username
    DOCKER_REGISTRY_SERVER_PASSWORD = var.acr_admin_password
    WEBSITES_PORT                   = 8080
  }
}

# ----------------------------------------------------------------------------------------------
# Azure Static Web App
# ----------------------------------------------------------------------------------------------
resource "azurerm_static_site" "this" {
  name                = "staticapp-${var.suffix}"
  resource_group_name = var.resource_group_name
  location            = "eastus2"
}
