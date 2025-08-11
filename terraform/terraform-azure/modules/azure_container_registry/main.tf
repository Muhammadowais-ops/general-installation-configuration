resource "azurerm_container_registry" "container" {
  location                      = var.acr_location
  name                          = var.acr_name
  public_network_access_enabled = var.acr_public_network_access_enabled
  resource_group_name           = var.resource_group_name
  retention_policy_in_days      = var.acr_retention_policy_in_days
  sku                           = var.acr_sku
}

