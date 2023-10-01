output "vm_pub_ip_output" {
  value = azurerm_public_ip.vm_pub_ip.ip_address
  description = "Public IP address of the virtual machine"
}

output "vm_username_output" {
  value = azurerm_linux_virtual_machine.vm_linux.admin_username
  sensitive = true
  description = "Virtual machine username"
}
  
output "vm_password_output" {
  value = azurerm_linux_virtual_machine.vm_linux.admin_password
  sensitive = true
  description = "Virtual machine secret"
}