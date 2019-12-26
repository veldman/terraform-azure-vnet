locals {
  ddos_plan_enabled = length(azurerm_network_ddos_protection_plan.cloudcommons) > 0
  ddos_plan_id      = local.ddos_plan_enabled == true ? azurerm_network_ddos_protection_plan.cloudcommons.0.id : null
}

resource "azurerm_virtual_network" "cloudcommons" {
  name                = "${var.name}-vnet"
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = var.address_space
  dns_servers         = var.dns_servers

  dynamic "ddos_protection_plan" {
    for_each = local.ddos_plan_enabled == true ? [1] : []
    content {
      id     = local.ddos_plan_id
      enable = local.ddos_plan_enabled
    }
  }

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
      security_group = var.nsg_enabled == true && subnet.value.security_group == true ? azurerm_network_security_group.cloudcommons.0.id : null
    }
  }

  tags = {
    app         = var.app
    environment = var.environment
    creator     = var.creator
  }
}
