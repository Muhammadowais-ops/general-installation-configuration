variable "resource_group_name" {
  description = "resource group name"
  type        = string
  default     = "testing-rg"
}

variable "storage_account_name" {
  description = "storage account name"
  type        = string
  default     = "mybuckettest321ll"
}

variable "account_replication_type"{
  description = "account type we are using default LRS "
  type        = string
  default     = "LRS"
}

variable "account_tier"{
  description = "account type"
  type        = string
  default     = "Standard"
}


variable "location"{
    default = ""
}