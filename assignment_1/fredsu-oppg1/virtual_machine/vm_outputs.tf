output "vm_pub_ip_output" {
  value = azurerm_public_ip.vm_pub_ip.ip_address
  description = "Public IP address of the virtual machine"
}