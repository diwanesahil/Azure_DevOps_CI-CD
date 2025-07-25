variable "resource_group_name" {
  type = string
  description = "Name of Resource Group"

}

variable "location" {
  type = string
  description = "Location of RG"

}

variable "storage_account_name" {
  type = string
  description = "name of storage account"
}

variable "admin_username" {
  type = string
  description = "Admin username for the VM"
}

variable "admin_password" {
  type = string
  description = "Admin password for the VM"
  sensitive = false
  
}