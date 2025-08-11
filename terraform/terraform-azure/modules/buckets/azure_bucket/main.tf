resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = "UAE North"  # Correct location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = "staging"
  }
}
