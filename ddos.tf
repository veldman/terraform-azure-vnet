locals {
  ddos_plan_enabled = length(azurerm_network_ddos_protection_plan.cloudcommons) > 0
  ddos_plan_id      = var.enabled && local.ddos_plan_enabled ? var.ddos_id == null ? azurerm_network_ddos_protection_plan.cloudcommons.0.id : var.ddos_id : null
}

resource "azurerm_network_ddos_protection_plan" "cloudcommons" {
  name                = "${var.name}-vnet-ddos"
  count               = var.ddos_enabled == true && var.ddos_id == null ? 1 : 0
  location            = var.location
  resource_group_name = var.resource_group

  tags = {
    app         = var.app
    environment = var.environment
    creator     = var.creator
  }
}
