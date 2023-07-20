# ----------------------------------------------------------------------------------------------
# Azure API Management
# ----------------------------------------------------------------------------------------------
resource "azurerm_api_management" "this" {
  name                = "openai${var.suffix}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  publisher_name      = "Company"
  publisher_email     = "company@terraform.io"

  sku_name = "Consumption_0"
}
