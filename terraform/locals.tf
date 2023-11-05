locals {
  workspace_suffix = terraform.workspace == "default" ? "" : terraform.workspace

  company_tags = {
    Company      = var.company_name
    Billing_code = var.billing_code
    Environment  = terraform.workspace
  }

  rg_website_name   = terraform.workspace == "default" ? var.base_name : "${var.rg_name}-${var.base_name}-${local.workspace_suffix}"
  sa_website_name   = terraform.workspace == "default" ? var.sa_name : "${var.sa_name}${var.base_name}${local.workspace_suffix}${random_string.random_string.result}"
  sc_website_name   = terraform.workspace == "default" ? var.sc_name : "${var.sc_name}${var.base_name}${local.workspace_suffix}"
  sa_accesskey_name = terraform.workspace == "default" ? var.sa_accesskey_name : "${var.sa_accesskey_name}${var.base_name}${local.workspace_suffix}"
  vnet_name         = terraform.workspace == "default" ? var.vnet_name : "${var.vnet_name}${var.base_name}${local.workspace_suffix}"
  nsg_name          = terraform.workspace == "default" ? var.nsg_name : "${var.nsg_name}${var.base_name}${local.workspace_suffix}"
  subnet_name       = terraform.workspace == "default" ? var.subnet_name : "${var.subnet_name}${var.base_name}${local.workspace_suffix}"
  vm_password_name  = terraform.workspace == "default" ? var.vm_name : "${var.vm_name}${var.base_name}${local.workspace_suffix}"
  kv_name = terraform.workspace == "default" ? var.kv_name : "${var.kv_name}${var.base_name}${local.workspace_suffix}"
}