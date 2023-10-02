resource "azurerm_resource_group" "kv_rg" {
  name     = var.kv_rg_name
  location = var.kv_rg_location
  tags = var.common_tags
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                        = var.kv_name
  location                    = azurerm_resource_group.kv_rg.location
  resource_group_name         = azurerm_resource_group.kv_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get","List","Create",
    ]

    secret_permissions = [
      "Get","Set","List",
    ]

    storage_permissions = [
      "Get","Set","List",
    ]
  }

  tags = var.common_tags
}

resource "azurerm_key_vault_secret" "kvs_sa_accesskey" {
  name         = var.kvs_name_accesskey
  value        = var.kvs_sa_accesskey
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "kvs_vm_username" {
  name         = var.kvs_name_username
  value        = var.kvs_vm_username
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "kvs_vm_password" {
  name         = var.kvs_name_secret
  value        = var.kvs_vm_secret
  key_vault_id = azurerm_key_vault.kv.id
  tags = var.common_tags
}