output "api_gateway_url" {
  value = module.computing.api_gateway_url
}

output "static_app_api_key" {
  sensitive = true
  value     = module.computing.static_app_apikey
}

output "static_app_url" {
  value = module.computing.static_app_url
}

output "container_registry_admin_username" {
  value = module.storage.container_registry_admin_username
}

output "container_registry_admin_password" {
  sensitive = true
  value     = module.storage.container_registry_admin_password
}

output "container_registry_login_server" {
  value = module.storage.container_registry_login_server
}
