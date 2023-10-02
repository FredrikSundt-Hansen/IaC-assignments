output "subnet_vm_id_output" {
    value = azurerm_subnet.subnet_vm.id
    description = "ID of the subnet for the virtual machine"
}

output "vnet_rg_location_output" {
    value = azurerm_resource_group.vnet_rg.location
    description = "Location of the virtual network resource group"
}
