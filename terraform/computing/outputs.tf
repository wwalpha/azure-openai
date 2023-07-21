output "api_gateway_url" {
  value = azurerm_api_management.this.gateway_url
}

output "static_app_apikey" {
  value = azurerm_static_site.this.api_key
}

output "static_app_url" {
  value = azurerm_static_site.this.default_host_name
}
