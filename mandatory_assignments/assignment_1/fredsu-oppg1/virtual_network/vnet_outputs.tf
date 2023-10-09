output "subnet_vm_id_output" {
    value = azurerm_subnet.subnet_vm.id
    description = "ID of the subnet for the virtual machine"
}

output "source_address_output" {
    value = azurerm_network_security_rule.ssh_inbound_myIP.source_address_prefix
    description = "Source address prefix of the network security rule for SSH inbound"
}