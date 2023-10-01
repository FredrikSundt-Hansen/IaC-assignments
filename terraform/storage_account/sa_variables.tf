variable "sa_rg_name" {
  type = string
  description = "Storage account resource group name"
}
  
variable "sa_rg_location" {
  type = string
  description = "Storage account resource group location"
}
  
variable "sa_name" {
  type = string
  description = "Storage account name"
}

variable "sc_name" {
  type = string
  description = "Storage container name"
}

variable "common_tags" {
  type = map(string)
  description = "Common tags"
} 
