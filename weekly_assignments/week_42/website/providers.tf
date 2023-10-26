terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "fredsu-rg-backend"
    storage_account_name = "sabetfsdfzp45oee3"
    container_name       = "tfstate"
    key                  = "week-39_static-website.terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}