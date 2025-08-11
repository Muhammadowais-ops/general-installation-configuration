variable "compartment_id" {
  description = "The OCID of the compartment where resources will be created"
  type        = string
  default     = "ocid1.tenancy.oc1..xxxxxxx"
}


variable "bucket_name" {
    description = "bucket name"
    type        = string
    default = "testmykgfg_bucket"

}

variable "bucket_namespace" {
    description = "bucket namespace"
    type        = string
    default = "axywkegtny5i"

}



variable "bucket_storage_tier" {
    description = "bucket tier"
    type        = string
    default = "Standard"

}