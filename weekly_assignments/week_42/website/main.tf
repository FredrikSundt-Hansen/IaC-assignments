resource "random_string" "random_string_name" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_resource_group" "rg_website" {
  name     = local.rg_website_name
  location = var.rg_website_location
  tags     = local.company_tags
}

resource "azurerm_storage_account" "sa_website" {
  name                     = "${lower(var.sa_website_name)}${random_string.random_string_name.result}"
  resource_group_name      = azurerm_resource_group.rg_website.name
  location                 = azurerm_resource_group.rg_website.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  static_website {
    index_document = var.index_document
  }

  tags = local.company_tags
}

resource "azurerm_storage_blob" "index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa_website.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "${var.source_content}${local.web_suffix}"
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.sa_website.primary_web_endpoint
}

#Test 