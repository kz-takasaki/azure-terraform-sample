resource "azurerm_resource_group" "res-0" {
  location = "japaneast"
  name     = "azure-terraform-sample"
}
resource "azurerm_service_plan" "res-1" {
  location            = "japaneast"
  name                = "ASP-azureterraformsample-b1dc"
  os_type             = "Linux"
  resource_group_name = "azure-terraform-sample"
  sku_name            = "P1v3"
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
