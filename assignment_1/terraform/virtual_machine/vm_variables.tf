variable "vm_rg_name" {
  type = string
  description = "Virtual machine resource group name"
}

variable "vm_rg_location" {
  type = string
  description = "Virtual machine resource group location"
}
  
variable "vm_pub_ip_name" {
  type = string
  description = "Virtual machine public IP name"
}
  
variable "vm_nic_name" {
  type = string
  description = "Virtual machine network interface name"
}

variable "vm_linux_name" {
  type = string
  description = "Virtual machine name"
}

variable "vm_subnet_id" {
  type = string
  description = "Virtual machine subnet ID"
}

variable "vm_username" {
  type = string
  description = "Virtual machine username"
  sensitive = true
}
  
variable "vm_password" {
  type = string
  description = "Virtual machine password"
  sensitive = true
}

variable "common_tags" {
  type = map(string)
  description = "Common tags for all resources"
}

variable "vm_size" {
  type = map(string)
  default = {
    "small"  = "Standard_B1s"
    "medium" = "Standard_B2s"
    "large"  = "Standard_B4ms"
  }
  description = "Virtual machine sizes (small, medium, large)"
}


