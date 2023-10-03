data "azurerm_key_vault_secret" "vm_credentials" {
  name         = azurerm_key_vault_secret.kvs_vm_credentials.name
  key_vault_id = azurerm_key_vault.kv.id
}

output "kvs_vm_username_output" {
  value = jsondecode(data.azurerm_key_vault_secret.vm_credentials.value)["username"]
  description = "Username of the virtual machine login"
}

output "kvs_vm_password_output" {
  value = jsondecode(data.azurerm_key_vault_secret.vm_credentials.value)["password"]
  description = "Password of the virtual machine login"
}