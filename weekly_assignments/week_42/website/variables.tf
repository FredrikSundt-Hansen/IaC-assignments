variable "rg_website_name" {
  type        = string
  description = "Name of the resource group for the website"
}

variable "rg_website_location" {
  type        = string
  description = "Location of the resource group for the website"
}

variable "sa_website_name" {
  type        = string
  description = "Name of the storage account for the website"
}

variable "index_document" {
  type        = string
  description = "Name of the index document"
  default     = "index.html"
}

variable "source_content" {
  type        = string
  description = "Path to the source content"
}

variable "company_name" {
  type        = string
  description = "Name of the company"
}

variable "billing_code" {
  type        = number
  description = "Billing code"
}

