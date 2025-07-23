resource "azurerm_mysql_flexible_server" "server" {
  name                              = var.mysql_name
  administrator_login               = var.administrator_login
  administrator_password            = var.administrator_password
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled
  location                          = var.mysql_location
  resource_group_name               = var.resource_group_name
  sku_name                          = var.sku_name
  version                           = var.mysql_version
  storage {
    auto_grow_enabled  = var.storage_auto_grow_enabled
    io_scaling_enabled = var.storage_io_scaling_enabled
    size_gb            = var.storage_size_gb
  }
}
