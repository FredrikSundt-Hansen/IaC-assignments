output "sa_primary_accesskey_output" {
  value = azurerm_storage_account.sa.primary_access_key
  description = "Primary access key for the storage account"
}