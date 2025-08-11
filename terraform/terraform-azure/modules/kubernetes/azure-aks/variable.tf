variable "aks_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "location" {
  description = "The Azure region where the AKS cluster will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group where the AKS cluster will be created."
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

variable "subnet_id" {
  description = "The ID of the subnet for the AKS node pool."
  type        = string
}


variable "aks_dns_ip"{
  description = "the ip of aks dns"
  type = string
}


variable "pod_cidr"{
  type = string
}


variable "service_cidr"{
  type = string
}


variable "windows_admin_password" {
  description = "The admin password for Windows nodes"
  type        = string
  sensitive   = true  # This ensures the password is treated as sensitive
}


variable "azure_container_id" {
  description = "The ID of the Azure Container Registry."
  type        = string
}