# ----------------------------------------------------------------------------------------------
# Azure OpenAI Cognitive Account
# ----------------------------------------------------------------------------------------------
resource "azurerm_cognitive_account" "this" {
  name                = "openai-${var.suffix}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  kind                = "OpenAI"
  sku_name            = "S0"

  identity {
    type = "SystemAssigned"
  }
}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

# ----------------------------------------------------------------------------------------------
# Azure Role Assignment
# ----------------------------------------------------------------------------------------------
resource "azurerm_role_assignment" "this" {
  scope                = data.azurerm_resource_group.this.id
  role_definition_name = "Cognitive Services OpenAI Contributor"
  principal_id         = azurerm_cognitive_account.this.identity[0].principal_id
}

