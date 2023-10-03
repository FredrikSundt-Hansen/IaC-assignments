variable "vnet_rg_name" {
  type = string
  description = "Virtual network resource group name"
}

variable "vnet_rg_location" {
  type = string
  description = "Virtual network resource group location"
}
  
variable "nsg_name" {
  type = string
  description = "Network security group name"
}

variable "vnet_name" {
  type = string
  description = "Virtual network name"
}

variable "subent_vm_name" {
  type = string
  description = "Subnet name"
}

variable "source_address" {
  type = string
  description = "Source IP address, public IP address of the client machine"
}

variable "common_tags" {
  type = map(string)
  description = "Common tags"
}
