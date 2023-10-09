variable "kv_rg_name" {
  type = string
  description = "Key vault resource group name"
}
  
variable "kv_rg_location" {
  type = string
  description = "Key vault resource group location"
}
  
variable "kv_name" {
  type = string
  description = "Key vault name"
}

variable "sku_name" {
  type = string
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium."
  validation {
    condition = var.sku_name == "standard" || var.sku_name == "premium"
    error_message = "The SKU name must be standard or premium"
  }
  default = "standard"
}

variable "kvs_sa_accesskey_name" {
  type = string
  description = "Key vault secret name for storage account access key"
}

variable "kvs_sa_accesskey" {
  type = string
  sensitive = true
  description = "Storage account access key"
}

variable "kvs_vm_credentials_name" {
  type = string
  description = "Key vault secret name for VM username"
}

variable "kvs_vm_username" {
  type = string
  sensitive = true
  description = "VM username"
}

variable "kvs_vm_password" {
  type = string
  sensitive = true
  description = "VM password"
}

variable "sa_name" {
  type = string
  description = "Storage account name"
}

variable "common_tags" {
  type = map(string)
  description = "Common tags"
}