locals {
  tags                         = { azd-env-name : var.environment_name }
  sha                          = base64encode(sha256("${var.environment_name}${var.location}${data.azurerm_client_config.current.subscription_id}"))
  resource_token               = substr(replace(lower(local.sha), "[^A-Za-z0-9_]", ""), 0, 13)
}

resource "azurecaf_name" "rg_name" {
  name          = var.environment_name
  resource_type = "azurerm_resource_group"
  random_length = 0
  clean_input   = true
}

# Deploy resource group
resource "azurerm_resource_group" "rg" {
  name     = azurecaf_name.rg_name.result
  location = var.location
  // Tag the resource group with the azd environment name
  // This should also be applied to all resources created in this module
  tags = { azd-env-name : var.environment_name }
}

module "app_plan" {
  source = "./core/host/appserviceplan"
  rg_name = azurerm_resource_group.rg.name
  location = var.location
  resource_token = "sdkbjsfvsrfb"
  tags = { azd-env-name : var.environment_name }
  sku_name = "B1"
  os_type = "Linux"
}

module "web_app" {
  source = "./core/host/appservice/appservicepython"
  rg_name = azurerm_resource_group.rg.name
  location = var.location
  resource_token = "jkwebguin"
  tags = { azd-env-name : var.environment_name, azd-service-name: "python-app" }
  appservice_plan_id = module.app_plan.APPSERVICE_PLAN_ID
  app_command_line = ""
  app_settings = {}
  service_name = "sfbkhdfs"
}

# Add resources to be provisioned below.
# To learn more, https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-change
# Note that a tag:
#   azd-service-name: "<service name in azure.yaml>"
# should be applied to targeted service host resources, such as:
#  azurerm_linux_web_app, azurerm_windows_web_app for appservice
#  azurerm_function_app for function
