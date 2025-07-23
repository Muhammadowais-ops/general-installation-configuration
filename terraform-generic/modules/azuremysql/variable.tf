variable "administrator_login" {
  description = "The administrator login for the MySQL server."
  type        = string
  default     = "mysqladmin"
}

variable "administrator_password" {
  description = "The administrator password for the MySQL server."
  type        = string
  sensitive   = true
}


variable "backup_retention_days" {
  description = "The number of days to retain backups."
  type        = number
  default     = 7
}



variable "geo_redundant_backup_enabled" {
  description = "Whether to enable geo-redundant backups."
  type        = bool
  default     = false
}

variable "mysql_location" {
  description = "The Azure region where the MySQL server will be deployed."
  type        = string
  default     = "uaenorth"
}

variable "mysql_name" {
  description = "The name of the MySQL server."
  type        = string

}


variable "replication_role" {
  description = "The replication role of the MySQL server."
  type        = string
  default     = "None"
}

variable "resource_group_name" {
  description = "The resource group name in which the MySQL server will be deployed."
  type        = string
  default     = "test"
}

variable "sku_name" {
  description = "The SKU name for the MySQL server."
  type        = string

}

variable "source_server_id" {
  description = "The source MySQL server ID if migrating from an existing server."
  type        = string
  default     = ""  # Can be updated based on the source server ID
}



variable "mysql_version" {
  description = "The version of MySQL to use."
  type        = string
  default     = "8.0.21"
}



variable "storage_auto_grow_enabled" {
  description = "Whether to enable auto-grow for storage."
  type        = bool
  default     = true
}

variable "storage_io_scaling_enabled" {
  description = "Whether to enable I/O scaling for storage."
  type        = bool
  default     = true
}



variable "storage_size_gb" {
  description = "The size of the storage in GB."
  type        = number
}
