terraform {
  required_version = ">=1.0"
  
  required_providers {
    # aws = {
    #   source  = "hashicorp/aws"
    #   version = "~> 6.0"
    # }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.2.0"  # This allows any 3.x.x version
    }
    # google = {
    #   source  = "hashicorp/google"
    #   version = "~> 4.0"
    # }
    # oci = {
    #   source  = "hashicorp/oci"
    #   version = "~> 4.0"
    # }
  }
  backend "azurerm" {                                         ---> use this configuration for state locking in azure 
      resource_group_name  = "xxxxx"
      storage_account_name = "xxxxx"
      container_name       = "xxxxxx"
      key                  = "terraform.tfstate"
  }
}

# AWS Provider Configuration (empty for now)
# provider "aws" {

# }

# Google Cloud Provider Configuration (empty for now)
# provider "google" {
 
# }

# Azure Provider Configuration (using the azurerm provider)
provider "azurerm" {
  subscription_id = "c45b407a-1a1f-4c95-8abc-10cfa51c8b07"
  features {}  # Required for Azure to work
}

# Oracle Cloud Provider Configuration (OCI)
# provider "oci" {
#   tenancy_ocid        = "ocid1.tenancy.xxxx"
#   user_ocid           = "ocid1.user.oc1..xxxxx"
#   fingerprint         = "f9:56:c2:72:e6:e8:5d:a5:70:5a:7c:de:96:7a:5e:3b"
#   private_key_path    = "/Users/xxxxx/Downloads/t.pem"
#   region              = "me-riyadh-1"
# }


