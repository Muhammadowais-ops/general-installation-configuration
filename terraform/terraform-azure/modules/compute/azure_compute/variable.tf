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

variable "resource_group_name" {
  description = "The resource group name"
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