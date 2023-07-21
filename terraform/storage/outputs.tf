output "storage_account_id" {
  value = azurerm_storage_account.this.id
}

output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "container_registry_login_server" {
  value = azurerm_container_registry.this.login_server
}

