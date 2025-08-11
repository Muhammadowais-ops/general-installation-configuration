variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
}



variable "zone"{
  type = string
}

variable "storage_name" {
  description = "Name of the storage bucket"
  type        = string
}
