locals {
  workspace_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  company_tags = {
    Company      = var.company_name
    Billing_code = var.billing_code
    Environment  = terraform.workspace
  }

  rg_website_name = terraform.workspace == "default" ? "${var.rg_website_name}" : "${var.rg_website_name}-${local.workspace_suffix}"
  sa_website_name = terraform.workspace == "default" ? "${var.sa_website_name}" : "${var.sa_website_name}${local.workspace_suffix}"
  web_suffix      = "<h2>${terraform.workspace}</h2>"
}