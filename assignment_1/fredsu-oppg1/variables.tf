# Key vault variables

variable "kv_rg_name" {
  type        = string
  description = "Key vault resource group name"
}

variable "kv_rg_location" {
  type        = string
  description = "Key vault resource group location"
}

variable "kv_name" {
  type        = string
  description = "Key vault name"
}

variable "sku_name" {
  type        = string
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium."
  validation {
    condition     = var.sku_name == "standard" || var.sku_name == "premium"
    error_message = "The SKU name must be standard or premium"
  }
  default = "standard"
}

variable "kvs_sa_accesskey_name" {
  type        = string
  description = "Key vault secret name for storage account access key"
}

variable "kvs_vm_credentials_name" {
  type        = string
  description = "Key vault secret name for VM username"
}

variable "vm_username" {
  type        = string
  sensitive   = true
  description = "VM username"
}

variable "vm_password" {
  type        = string
  sensitive   = true
  description = "VM password"
}

# Virtual network variables

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

# Storage account variables

variable "sa_rg_name" {
  type        = string
  description = "Storage account resource group name"
}

variable "sa_rg_location" {
  type        = string
  description = "Storage account resource group location"
}

variable "sa_name" {
  type        = string
  description = "Storage account name"
}

variable "sa_container_name" {
  type        = string
  description = "Storage container name"
}

# Virtual machine variables

variable "vm_rg_name" {
  type        = string
  description = "Virtual machine resource group name"
}

variable "vm_rg_location" {
  type        = string
  description = "Virtual machine resource group location"
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

variable "vm_size" {
  type        = string
  default     = "small"
  description = "value of the virtual machine size (small, medium, large)"
}

# Tags variables

variable "company_name" {
  type        = string
  description = "Company name"
}

variable "project_name" {
  type        = string
  description = "Project name"
}


