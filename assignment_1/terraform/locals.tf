locals {
  common_tags = {
    company = var.company_name
    project = "${var.company_name}-${var.project_name}"
  }
}