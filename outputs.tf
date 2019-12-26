output "id" {
  value       = "${azurerm_virtual_network.cloudcommons.id}"
  description = "VNET Id"
}

output "subnets" {
    value     = azurerm_virtual_network.cloudcommons.subnet
    description = "Subnet"
}