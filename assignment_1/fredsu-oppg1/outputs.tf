output "vm_pub_ip_output" {
  value       = module.virtual_machine.vm_pub_ip_output
  description = "Public IP address of the virtual machine"
}

output "source_address_output" {
  value       = module.virtual_network.source_address_output
  description = "Source address prefix of the network security rule for SSH inbound"
}