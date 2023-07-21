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
