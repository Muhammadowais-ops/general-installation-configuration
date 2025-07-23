variable "vnet_name" {
  description = "The name of the Virtual Network."
  type        = string
}

variable "vnet_location" {
  description = "The location where the Virtual Network will be created."
  type        = string
}

variable "vnet_address" {
  description = "The address space for the whole virtual network."
  type        = list(string)
}

variable "resource_group_name" {
  description = "The resource group where the Virtual Network will be created."
  type        = string
}

variable "subnet_names" {
  description = "A list of subnet names to be created."
  type        = list(string)
}

variable "subnet_values" {
  description = "A list of subnet address prefixes to be assigned."
  type        = list(string)
}



