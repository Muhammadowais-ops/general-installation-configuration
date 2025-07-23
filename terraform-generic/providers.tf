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
}

# AWS Provider Configuration (empty for now)
# provider "aws" {

# }

# Google Cloud Provider Configuration (empty for now)
# provider "google" {
 
# }

# Azure Provider Configuration (using the azurerm provider)
provider "azurerm" {
  subscription_id = ""
  features {}  # Required for Azure to work
}

# Oracle Cloud Provider Configuration (OCI)
# provider "oci" {
#   tenancy_ocid        = "ocid1.tenancy.xxxx"
#   user_ocid           = "ocid1.user.oc1..xxxxx"
#   fingerprint         = "f9:5:7c:de:96:7a:5e:3b"
#   private_key_path    = "/Users/xxxxx/Downloads/t.pem"
#   region              = "m"
# }


