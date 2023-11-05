locals {
  workspace_suffix = terraform.workspace == "default" ? "" : terraform.workspace

  company_tags = {
    Company      = var.company_name
    Billing_code = var.billing_code
    Environment  = terraform.workspace
  }

  rg_name           = terraform.workspace == "default" ? "${var.rg_name}-${var.base_name}" : "${var.rg_name}-${var.base_name}-${local.workspace_suffix}"
  sa_name           = terraform.workspace == "default" ? "${var.sa_name}${var.base_name}${random_string.random_string.result}" : "${var.sa_name}${var.base_name}${local.workspace_suffix}${random_string.random_string.result}"
  sc_name           = terraform.workspace == "default" ? "${var.sc_name}-${var.base_name}" : "${var.sc_name}-${var.base_name}-${local.workspace_suffix}"
  sa_accesskey_name = terraform.workspace == "default" ? "${var.sa_accesskey_name}${azurerm_storage_account.sa.name}" : "${var.sa_accesskey_name}${azurerm_storage_account.sa.name}${local.workspace_suffix}"
  vnet_name         = terraform.workspace == "default" ? var.vnet_name : "${var.vnet_name}${local.workspace_suffix}"
  nsg_name          = terraform.workspace == "default" ? var.nsg_name : "${var.nsg_name}${local.workspace_suffix}"
  subnet_name       = terraform.workspace == "default" ? var.subnet_name : "${var.subnet_name}${local.workspace_suffix}"
  vm_password_name  = terraform.workspace == "default" ? "${var.vm_name}${random_string.random_string.result}" : "${var.vm_name}${local.workspace_suffix}${random_string.random_string.result}"
  kv_name           = terraform.workspace == "default" ? "${var.kv_name}-${var.base_name}-${random_string.random_string.result}" : "${var.kv_name}-${var.base_name}-${local.workspace_suffix}-${random_string.random_string.result}"
  pip_name          = terraform.workspace == "default" ? "${var.pip_name}-${var.base_name}" : "${var.pip_name}-${var.base_name}-${local.workspace_suffix}"
  vm_nic_name       = terraform.workspace == "default" ? "${var.vm_nic_name}-${var.base_name}" : "${var.vm_nic_name}-${var.base_name}-${local.workspace_suffix}"
  linux_vm_name     = terraform.workspace == "default" ? "${var.vm_name}-${var.base_name}" : "${var.vm_name}-${var.base_name}-${local.workspace_suffix}"

  additional_ip_rules = ["88.95.181.84"] # Any existing IP rules
  github_action_ip_addresses = file("github-actions-ip-addresses.txt")
}