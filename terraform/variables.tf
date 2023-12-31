# General variables 
variable "base_name" {
  type        = string
  default     = "operraterra"
  description = "value of the base name"
}

variable "rg_name" {
  type        = string
  default     = "fredsu-rg"
  description = "Name of the resource group to create"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Azure region to deploy resources"
}

# Variable for the storageaccount.tf 
variable "sa_name" {
  type        = string
  default     = "sa"
  description = "value of the storage account name"
}

variable "sc_name" {
  type        = string
  default     = "sc"
  description = "value of the storage container name"
}

# Variables for the virtualnetwork.tf 
variable "vnet_name" {
  type        = string
  default     = "vnet"
  description = "Name of the virtual network to create"
}

variable "nsg_name" {
  type        = string
  default     = "nsg"
  description = "Name of the network security group to create"
}

variable "subnet_name" {
  type        = string
  default     = "subnet"
  description = "Name of the subnet to create"
}

# Variables for company tags
variable "company_name" {
  type        = string
  default     = "OperaTerra AS"
  description = "Name of the company"
}

variable "billing_code" {
  type        = string
  default     = "123456"
  description = "Billing code for the company"
}