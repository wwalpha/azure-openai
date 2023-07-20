# ----------------------------------------------------------------------------------------------
# Azure Storage Account
# ----------------------------------------------------------------------------------------------
resource "azurerm_storage_account" "this" {
  name                          = "storage${var.suffix}"
  resource_group_name           = var.resource_group_name
  location                      = var.resource_group_location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  min_tls_version               = "TLS1_2"
  public_network_access_enabled = true
  enable_https_traffic_only     = true
}

# ----------------------------------------------------------------------------------------------
# Azure Storage Container
# ----------------------------------------------------------------------------------------------
resource "azurerm_storage_container" "this" {
  name                  = "cdn"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "container"
}
