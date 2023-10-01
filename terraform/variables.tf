variable "kv_rg_name" {
  type        = string
  description = "Key vault resource group name"
}

variable "kv_name" {
  type        = string
  description = "Key vault name"
}

variable "kvs_name_accesskey" {
  type        = string
  description = "Key vault secret name for storage account access key"
}

variable "kvs_name_username" {
  type        = string
  description = "Key vault secret name for VM username"
}

variable "kvs_name_secret" {
  type        = string
  description = "Key vault secret name for VM secret"
}

variable "vnet_rg_name" {
  type        = string
  description = "Virtual network resource group name"
}

variable "vnet_rg_location" {
  type        = string
  description = "Virtual network resource group location"
}

variable "nsg_name" {
  type        = string
  description = "Network security group name"
}

variable "vnet_name" {
  type        = string
  description = "Virtual network name"
}

variable "subent_vm_name" {
  type        = string
  description = "Subnet name"
}

variable "source_address" {
  type        = string
  description = "Source IP address, public IP address of the client machine"
}

variable "sa_rg_name" {
  type        = string
  description = "Storage account resource group name"
}

variable "sa_name" {
  type        = string
  description = "Storage account name"
}

variable "sc_name" {
  type        = string
  description = "Storage container name"
}

variable "vm_rg_name" {
  type        = string
  description = "Virtual machine resource group name"
}

variable "vm_pub_ip_name" {
  type        = string
  description = "Virtual machine public IP name"
}

variable "vm_nic_name" {
  type        = string
  description = "Virtual machine network interface name"
}

variable "vm_linux_name" {
  type        = string
  description = "Virtual machine name"
}

variable "vm_username" {
  type        = string
  sensitive   = true
  description = "Virtual machine username"
}

variable "vm_password" {
  type        = string
  sensitive   = true
  description = "Virtual machine password"
}

variable "company_name" {
  type        = string
  description = "Company name"
}

variable "project_name" {
  type        = string
  description = "Project name"
}



