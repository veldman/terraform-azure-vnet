resource "azurerm_network_ddos_protection_plan" "cloudcommons" {
  name                = "${var.name}-vnet-ddos"
  count               = var.ddos_enabled == true ? 1 : 0
  location            = var.location
  resource_group_name = var.resource_group

  tags = {
    app         = var.app
    environment = var.environment
    creator     = var.creator
  }
}
