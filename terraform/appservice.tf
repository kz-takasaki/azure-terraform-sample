resource "azurerm_linux_web_app" "backend" {
  https_only          = true
  location            = "japaneast"
  name                = "tonnsama-azure-terraform-sample-backend"
  resource_group_name = "azure-terraform-sample"
  service_plan_id     = azurerm_service_plan.backend.id
  site_config {
    ftps_state = "FtpsOnly"
    always_on  = false
  }
  app_settings = {
    "ENV" = "dev"
  }
  depends_on = [
    azurerm_service_plan.backend,
  ]
}

resource "azurerm_service_plan" "backend" {
  location            = "japaneast"
  name                = "ASP-azureterraformsample-b1dc"
  os_type             = "Linux"
  resource_group_name = "azure-terraform-sample"
  sku_name            = "F1"
  depends_on = [
    azurerm_resource_group.dev,
  ]
}

resource "azurerm_app_service_custom_hostname_binding" "backend" {
  app_service_name    = "tonnsama-azure-terraform-sample-backend"
  hostname            = "tonnsama-azure-terraform-sample-backend.azurewebsites.net"
  resource_group_name = "azure-terraform-sample"
  depends_on = [
    azurerm_linux_web_app.backend,
  ]
}
