variable "acr_name" {
  description = "The name of the Azure Container Registry."
  type        = string
}

variable "acr_location" {
  description = "The Azure region where the container registry will be located."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the container registry will be created."
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

# You can optionally add a variable for network_rule_bypass_option if you plan to use it.
# variable "network_rule_bypass_option" {
#   description = "Specifies whether to allow network bypass for certain Azure services."
#   type        = string
#   default     = "AzureServices"
# }
