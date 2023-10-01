output "username_output" {
  value       = module.key_vault.username_output
  sensitive   = true
  description = "Username for the virtual machine"
}

output "secret_output" {
  value       = module.key_vault.secret_output
  sensitive   = true
  description = "Secret for the virtual machine"
}

output "vm_pub_ip_output" {
  value       = module.virtualmachine.vm_pub_ip_output
  description = "Public IP address of the virtual machine"
}