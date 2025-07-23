# variable "compartment_id" {
#   description = "The OCID of the compartment where resources will be created"
#   type        = string
#   default     = "ocid1.tenancy.oc1..xxxxxx"
# }

# Root variables configuration


#### all resource group will lie in this resource group name variable

variable "resource_group_name" {
  description = "The resource group where the Virtual Network will be created."
  type        = string
}

# The name of the Virtual Network.
variable "vnet_name" {
  description = "The name of the Virtual Network."
  type        = string
}

# The location where the Virtual Network will be created.
variable "vnet_location" {
  description = "The location where the Virtual Network will be created."
  type        = string
}

# The address space for the whole virtual network.
variable "vnet_address" {
  description = "The address space for the whole virtual network."
  type        = list(string)
}




variable "resource_group_location" {
  description = "The resource group where the Virtual Network will be created."
  type        = string
}


# A list of subnet names to be created.
variable "subnet_names" {
  description = "A list of subnet names to be created."
  type        = list(string)
}

# A list of subnet address prefixes to be assigned.
variable "subnet_values" {
  description = "A list of subnet address prefixes to be assigned."
  type        = list(string)
}

# AKS Cluster settings

variable "aks_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "location" {
  description = "The Azure region where the AKS cluster will be created."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use."
  type        = string
}

variable "sku_tier" {
  description = "The SKU tier for the AKS cluster."
  type        = string
}

variable "node_pool_name" {
  description = "The name of the default node pool."
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the default node pool."
  type        = number
}

variable "vm_size" {
  description = "The size of the VM instances in the node pool."
  type        = string
}

variable "os_disk_size" {
  description = "The size of the OS disk for the node pool."
  type        = number
}

variable "os_disk_type" {
  description = "The type of OS disk for the node pool."
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the AKS cluster."
  type        = map(string)
  default     = {}
}

# AKS Networking settings

variable "subnet_id" {
  description = "The ID of the subnet for the AKS node pool."
  type        = string
}

variable "aks_dns_ip"{
  description = "The DNS IP address for the AKS cluster."
  type        = string
}

variable "pod_cidr" {
  description = "The CIDR block for pods in the AKS cluster."
  type        = string
}

variable "service_cidr" {
  description = "The CIDR block for services in the AKS cluster."
  type        = string
}

variable "windows_admin_password" {
  description = "The admin password for Windows nodes"
  type        = string
  sensitive   = true  # This ensures the password is treated as sensitive
}











################### vm variables ###########

# Azure VM module variables

variable "subnet_id_vm" {
  description = "The ID of the subnet for the VM's network interface"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the VM"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "allow_extension_operations" {
  description = "Allow extension operations on the VM"
  type        = bool
  default     = true
}

variable "computer_name" {
  description = "The computer name for the VM"
  type        = string
  default     = "test-vm"
}

variable "disable_password_authentication" {
  description = "Disables password authentication for the VM"
  type        = bool
  default     = false
}

variable "vm_location" {
  description = "The location where the VM will be deployed"
  type        = string
  default     = "uaenorth"
}

variable "name" {
  description = "The name of the VM"
  type        = string
  default     = "test-vm"
}

variable "network_interface_ids" {
  description = "The list of network interface IDs attached to the VM"
  type        = string
}



variable "size" {
  description = "The size of the VM"
  type        = string
  default     = "Standard_B2s"
}

variable "source_image_id" {
  description = "The source image ID for the VM"
  type        = string
  default     = ""
}

# Additional VM-specific variables (for boot diagnostics, OS disk, etc.)
variable "boot_diagnostics_storage_account_uri" {
  description = "The URI of the storage account used for boot diagnostics"
  type        = string
}

variable "os_disk_disk_size_gb" {
  description = "The size of the OS disk in GB"
  type        = number
  default     = 30
}

variable "os_disk_name" {
  description = "The name of the OS disk"
  type        = string
  default     = "osdisk"
}

variable "os_disk_storage_account_type" {
  description = "The storage account type for the OS disk"
  type        = string
  default     = "Standard_LRS"
}

variable "source_image_reference_offer" {
  description = "The offer for the source image reference"
  type        = string

}

variable "source_image_reference_publisher" {
  description = "The publisher for the source image reference"
  type        = string

}

variable "source_image_reference_sku" {
  description = "The SKU for the source image reference"
  type        = string

}

variable "source_image_reference_version" {
  description = "The version for the source image reference"
  type        = string

}


variable "create_public_ip" {
  description = "Set to true to create a public IP address for the VM"
  type        = bool
}



######## azure mysql database ######


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



########## azure acr ########


variable "acr_name" {
  description = "The name of the Azure Container Registry."
  type        = string
}

variable "acr_location" {
  description = "The Azure region where the container registry will be located."
  type        = string
}



variable "acr_public_network_access_enabled" {
  description = "Whether to allow public network access to the container registry."
  type        = bool
  default     = true
}

variable "acr_retention_policy_in_days" {
  description = "The number of days to retain the images in the registry. Set to 0 for no retention policy."
  type        = number
  default     = 0
}

variable "acr_sku" {
  description = "The SKU of the Azure Container Registry."
  type        = string
  default     = "Standard"  # The default SKU for Azure Container Registry
}


variable "azure_container_id"{
  description = "Get acr id"
  type = string
  default = "0"

}