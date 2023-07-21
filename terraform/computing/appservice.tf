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
}

# ----------------------------------------------------------------------------------------------
# Deploy code from a public GitHub repo
# ----------------------------------------------------------------------------------------------
# resource "azurerm_app_service_source_control" "sourcecontrol" {
#   app_id                 = azurerm_linux_web_app.this.id
#   repo_url               = "https://github.com/Azure-Samples/nodejs-docs-hello-world"
#   branch                 = "master"
#   use_manual_integration = true
#   use_mercurial          = false
# }

# ----------------------------------------------------------------------------------------------
# Azure Static Web App
# ----------------------------------------------------------------------------------------------
resource "azurerm_static_site" "this" {
  name                = "staticapp-${var.suffix}"
  resource_group_name = var.resource_group_name
  location            = "eastus2"
}
