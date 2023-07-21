# ----------------------------------------------------------------------------------------------
# Azure Container Registry
# ----------------------------------------------------------------------------------------------
resource "azurerm_container_registry" "this" {
  name                          = "openai${var.suffix}"
  resource_group_name           = var.resource_group_name
  location                      = var.resource_group_location
  sku                           = "Basic"
  admin_enabled                 = true
  public_network_access_enabled = true
  anonymous_pull_enabled        = false
}

# ----------------------------------------------------------------------------------------------
# Null Resource
# ----------------------------------------------------------------------------------------------
# resource "null_resource" "this" {
#   triggers = {
#     file_content_md5 = md5(file("${path.module}/scripts/dockerbuild.sh"))
#   }

#   provisioner "local-exec" {
#     command = "sh ${path.module}/scripts/dockerbuild.sh"

#     environment = {
#       FOLDER_PATH    = "demo"
#       AWS_REGION     = local.region
#       AWS_ACCOUNT_ID = local.account_id
#       REPO_URL       = aws_ecr_repository.this.repository_url
#     }
#   }
# }
