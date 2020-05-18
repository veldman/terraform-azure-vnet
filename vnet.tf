locals {
  lifecycle_enabled = len(var.lifecycle_ignore_changes) > 0 || var.lifecycle_create_before_destroy || var.lifecycle_prevent_destroy
}

resource "azurerm_virtual_network" "cloudcommons" {
  name                = "${var.name}-vnet"
  count               = var.enabled ? 1 : 0
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

  dynamic "lifecycle" {
    for_each = local.lifecycle_enabled ? [1] : []
    content {
      ignore_changes        = len(var.lifecycle_ignore_changes) > 0 ? var.lifecycle_ignore_changes : null
      create_before_destory = var.lifecycle_create_before_destroy
      prevent_destroy       = var.lifecycle_prevent_destroy
    }
  }

  tags = {
    app         = var.app
    environment = var.environment
    creator     = var.creator
  }
}
