# Requirements

## Github Action Secrets
下記シークレットキーを追加する

### TF_API_TOKEN
https://app.terraform.io/app/settings/tokens

### AZURE_CREDENTIALS
生成した JSON を設定する

```sh
az ad sp create-for-rbac --name "app_name" --role contributor --scopes /subscriptions/{subscription_id} --sdk-auth

{
  "clientId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "clientSecret": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  "subscriptionId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "tenantId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
```

### AZURE_STATIC_WEB_APPS_API_TOKEN
Static Web App のコンソールから取得する

### AZURE_WEBAPP_PUBLISH_PROFILE
Web App のコンソールからダウンロードする