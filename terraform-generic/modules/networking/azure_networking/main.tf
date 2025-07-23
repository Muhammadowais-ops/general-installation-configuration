resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}-vnet"
  location            = var.vnet_location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address


}

resource "azurerm_subnet" "subnet" {
  count               = length(var.subnet_names)
  name                = var.subnet_names[count.index]
  resource_group_name = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes    = [var.subnet_values[count.index]]


}


