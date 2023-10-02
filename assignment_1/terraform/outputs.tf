output "vm_pub_ip_output" {
  value       = module.virtual_machine.vm_pub_ip_output
  description = "Public IP address of the virtual machine"
}