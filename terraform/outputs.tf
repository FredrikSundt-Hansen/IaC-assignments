output "vm_pub_ip_output" {
  value       = module.virtualmachine.vm_pub_ip_output
  description = "Public IP address of the virtual machine"
}