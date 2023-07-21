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
    always_on                               = false
    minimum_tls_version                     = 1.2
    container_registry_use_managed_identity = true

    application_stack {
      docker_image_name   = "openai:latest"
      docker_registry_url = "https://${var.acr_login_server}"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    WEBSITES_PORT                       = 8080
  }
}

# ----------------------------------------------------------------------------------------------
# Azure Role Assignment
# ----------------------------------------------------------------------------------------------
resource "azurerm_role_assignment" "app" {
  scope                = data.azurerm_resource_group.this.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_linux_web_app.this.identity[0].principal_id
}

# ----------------------------------------------------------------------------------------------
# Azure Static Web App
# ----------------------------------------------------------------------------------------------
resource "azurerm_static_site" "this" {
  name                = "staticapp-${var.suffix}"
  resource_group_name = var.resource_group_name
  location            = "eastus2"
}
