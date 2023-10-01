output "username_output" {
  value = azurerm_key_vault_secret.kvs_vm_username.value
  description = "Username for the virtual machine in the key vault"
}

output "secret_output" {
  value = azurerm_key_vault_secret.kvs_vm_password.value
  description = "Password for the virtual machine in the key vault"
}