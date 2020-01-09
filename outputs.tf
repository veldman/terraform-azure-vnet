output "id" {
  value       = var.enabled ? azurerm_virtual_network.cloudcommons[0].id : null
  description = "VNET Id"
}

output "subnets" {
    value     = var.enabled ? tolist(azurerm_virtual_network.cloudcommons[0].subnet) : null
    description = "Subnet"
}