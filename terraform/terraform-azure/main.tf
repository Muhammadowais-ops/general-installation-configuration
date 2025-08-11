#terraform plan -var-file="values.tfvars" -var="subnet_id=0" -var="subnet_id_vm=1" -var="network_interface_ids=1"  -out main.tfplan           ----->        command for execution
#terraform plan -var-file="values.tfvars" -var="subnet_id=0" -var="subnet_id_vm=1" -var="network_interface_ids=1"  -destroy -out main.destroy.tfplan           -----> command for execution

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}



module "azure_networking" {
  source              = "./modules/networking/azure_networking"  # Correct relative path to module

  vnet_name           = var.vnet_name
  vnet_location       = var.vnet_location
  vnet_address        = var.vnet_address
  resource_group_name = azurerm_resource_group.rg.name
  subnet_names        = var.subnet_names
  subnet_values       = var.subnet_values
}


module "az_cnt_registry"{
  source = "./modules/azure_container_registry"
  acr_location                      = var.acr_location
  acr_name                          = var.acr_name
  acr_public_network_access_enabled = var.acr_public_network_access_enabled
  resource_group_name              = azurerm_resource_group.rg.name
  acr_retention_policy_in_days      = var.acr_retention_policy_in_days
  acr_sku                           = var.acr_sku

}


module "azure_aks" {
  source              = "./modules/kubernetes/azure-aks"  # Path to the AKS module

  aks_name            = var.aks_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version
  node_pool_name      = var.node_pool_name
  node_count          = var.node_count
  vm_size             = var.vm_size
  os_disk_size        = var.os_disk_size
  os_disk_type        = var.os_disk_type
  # tags                = var.tags
  subnet_id           = module.azure_networking.subnet_ids[0]  # Use the output from networking module
  aks_dns_ip          = var.aks_dns_ip
  pod_cidr            = var.pod_cidr
  service_cidr        = var.service_cidr
  windows_admin_password = var.windows_admin_password
  sku_tier            = var.sku_tier
  azure_container_id  = module.az_cnt_registry.id
  
}



module "azure_vm" {
  source              = "./modules/compute/azure_compute"  # Path to the Azure VM module
  admin_password         = var.admin_password
  admin_username         = var.admin_username
  allow_extension_operations = var.allow_extension_operations
  computer_name          = var.computer_name
  disable_password_authentication = var.disable_password_authentication
  #location               = var.vm_location
  name                   = var.name
  network_interface_ids  = module.azure_networking.subnet_ids[1]  # Pass subnet ID from the networking module
  resource_group_name    = azurerm_resource_group.rg.name  # Pass resource group to the VM module
  size                   = var.size
  source_image_id        = var.source_image_id
  subnet_id_vm              = module.azure_networking.subnet_ids[1]  # Pass subnet ID from the networking module
  boot_diagnostics_storage_account_uri = module.azure_vm.boot_diagnostics_storage_account_uri
  
  source_image_reference_offer     = var.source_image_reference_offer
  source_image_reference_publisher = var.source_image_reference_publisher
  source_image_reference_sku       = var.source_image_reference_sku
  source_image_reference_version   = var.source_image_reference_version
  create_public_ip           = var.create_public_ip
  
}



module "azure_mysql" {
  source = "./modules/azuremysql"
  mysql_name                        = var.mysql_name
  administrator_login               = var.administrator_login
  administrator_password            = var.administrator_password
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled
  mysql_location                    = var.mysql_location
  resource_group_name               = azurerm_resource_group.rg.name
  sku_name                          = var.sku_name
  # version                           = var.mysql_version
  storage_auto_grow_enabled         = var.storage_auto_grow_enabled
  storage_io_scaling_enabled        = var.storage_io_scaling_enabled
  storage_size_gb                   = var.storage_size_gb

}




# module "oracle_bucket_value" {
#   source = "./modules/buckets/oracle_bucket"  # Ensure correct relative path
# }