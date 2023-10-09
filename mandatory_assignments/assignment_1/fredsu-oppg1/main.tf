resource "random_string" "random_string_name" {
  length  = 10
  special = false
  upper   = false
}

module "virtual_network" {
  source           = "./virtual_network"
  vnet_rg_name     = var.vnet_rg_name
  vnet_rg_location = var.vnet_rg_location
  nsg_name         = var.nsg_name
  vnet_name        = var.vnet_name
  subent_vm_name   = var.subent_vm_name
  source_address   = var.source_address
  common_tags      = local.common_tags
}

module "virtual_machine" {
  source         = "./virtual_machine"
  vm_rg_name     = var.vm_rg_name
  vm_rg_location = var.vm_rg_location
  vm_pub_ip_name = var.vm_pub_ip_name
  vm_nic_name    = var.vm_nic_name
  vm_linux_name  = var.vm_linux_name
  vm_username    = module.key_vault.kvs_vm_username_output
  vm_password    = module.key_vault.kvs_vm_password_output
  vm_subnet_id   = module.virtual_network.subnet_vm_id_output
  common_tags    = local.common_tags
}

module "storage_account" {
  source            = "./storage_account"
  sa_rg_name        = var.sa_rg_name
  sa_rg_location    = var.sa_rg_location
  sa_name           = "${lower(var.sa_name)}${random_string.random_string_name.result}"
  sa_container_name = var.sa_container_name
  common_tags       = local.common_tags
}

module "key_vault" {
  source                  = "./key_vault"
  kv_rg_name              = var.kv_rg_name
  kv_rg_location          = var.kv_rg_location
  kv_name                 = "${lower(var.kv_name)}${random_string.random_string_name.result}"
  sku_name                = var.sku_name
  kvs_sa_accesskey_name   = var.kvs_sa_accesskey_name
  kvs_sa_accesskey        = module.storage_account.sa_primary_accesskey_output
  kvs_vm_credentials_name = var.kvs_vm_credentials_name
  kvs_vm_username         = var.vm_username
  kvs_vm_password         = var.vm_password
  sa_name                 = module.storage_account.sa_name_output
  common_tags             = local.common_tags
}
