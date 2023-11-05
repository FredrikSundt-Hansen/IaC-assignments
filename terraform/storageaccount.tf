resource "azurerm_storage_account" "sa" {
  name                     = local.sa_name
  resource_group_name      = azurerm_resource_group.rg-infra.name
  location                 = azurerm_resource_group.rg-infra.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  tags                     = local.company_tags
}

resource "azurerm_storage_container" "sc" {
  name                  = local.sc_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}