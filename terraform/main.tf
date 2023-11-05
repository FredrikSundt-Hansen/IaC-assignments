# Resource Group for all resources  
resource "azurerm_resource_group" "rg-infra" {
  name     = local.rg_name
  location = var.location
}

resource "random_string" "random_string" {
  length  = 3
  special = false
  upper   = false
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!%&*()-_=+[]{}<>:?"
}