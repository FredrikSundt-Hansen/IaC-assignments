resource "random_string" "random" {
  length           = 10
  special          = false
  upper = false
}


resource "azurerm_resource_group" "sa_rg" {
  name     = var.sa_rg_name
  location = var.sa_rg_location
  tags = var.common_tags
}

resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.sa_rg.name
  location                 = azurerm_resource_group.sa_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = var.common_tags
}

resource "azurerm_storage_container" "sc" {
  name                  = var.sc_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}