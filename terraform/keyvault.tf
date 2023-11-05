data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                        = local.kv_name
  location                    = azurerm_resource_group.rg-infra.location
  resource_group_name         = azurerm_resource_group.rg-infra.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = true

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"
    ]

    secret_permissions = [
      "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
    ]

    storage_permissions = [
      "Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"
    ]
  }

  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
    ip_rules       = ["88.95.181.84"]
  }

  tags = local.company_tags
}

resource "azurerm_key_vault_secret" "sa_accesskey" {
  name         = local.sa_accesskey_name
  value        = azurerm_storage_account.sa.primary_access_key
  key_vault_id = azurerm_key_vault.kv.id
  depends_on = [
    azurerm_storage_account.sa
  ]
  content_type    = "storage account access key"
  expiration_date = "2023-11-30T16:51:11.000Z"
  tags            = local.company_tags
}

resource "azurerm_key_vault_secret" "vm_password" {
  name         = local.vm_password_name
  value        = random_password.password.result
  key_vault_id = azurerm_key_vault.kv.id
  depends_on = [
    random_password.password
  ]
  content_type    = "vm password"
  expiration_date = "2023-11-30T16:51:11.000Z"
  tags            = local.company_tags
}