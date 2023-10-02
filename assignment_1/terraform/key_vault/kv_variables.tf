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

variable "kvs_name_accesskey" {
  type = string
  description = "Key vault secret name for storage account access key"
}

variable "kvs_sa_accesskey" {
  type = string
  sensitive = true
  description = "Storage account access key"
}

variable "kvs_name_username" {
  type = string
  description = "Key vault secret name for VM username"
}

variable "kvs_vm_username" {
  type = string
  sensitive = true
  description = "VM username"
}

variable "kvs_name_secret" {
  type = string
  description = "Key vault secret name for VM secret"
}
  
variable "kvs_vm_secret" {
  type = string
  sensitive = true
  description = "VM secret"
}

variable "common_tags" {
  type = map(string)
  description = "Common tags"
}