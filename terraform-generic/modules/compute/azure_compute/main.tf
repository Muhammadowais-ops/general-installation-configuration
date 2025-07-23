resource "azurerm_network_security_group" "group" {
  name                = "${var.name}-nsg"
  location            = var.vm_location
  resource_group_name = var.resource_group_name
}


resource "azurerm_public_ip" "ip" {
  count               = var.create_public_ip ? 1 : 0
  name                = "${var.name}-public-ip"
  location            = var.vm_location
  resource_group_name = var.resource_group_name
  sku                  = "Basic"
  allocation_method   = "Dynamic"
}


resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.name}-nic"
  location            = var.vm_location
  resource_group_name = var.resource_group_name  # Reference the resource group

  timeouts {
    create = "10m"  # Set the timeout for creating the resource to 10 minutes
    update = "10m"  # Set the timeout for updating the resource to 10 minutes
    delete = "10m"  # Set the timeout for deleting the resource to 10 minutes
  }

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id_vm  # Use the subnet ID passed from the root module
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.create_public_ip ? azurerm_public_ip.ip[0].id : null
  }

  depends_on = [azurerm_network_security_group.group]  # Ensure NSG is not deleted before NIC
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.vm_nic.id
  network_security_group_id = azurerm_network_security_group.group.id

  depends_on = [azurerm_network_interface.vm_nic]  # Ensure NIC is deleted first
}


resource "random_id" "random_id" {
  byte_length = 4  # Customize the length if you need a specific length for uniqueness
}

resource "azurerm_storage_account" "my_storage_account" {
  name                     = "testvmdiag${random_id.random_id.hex}"
  location                 = var.vm_location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}



resource "azurerm_linux_virtual_machine" "res-0" {
  admin_password                                         = var.admin_password
  admin_username                                         = var.admin_username
  allow_extension_operations                             = var.allow_extension_operations
  computer_name                                          = var.computer_name
  disable_password_authentication                        = var.disable_password_authentication
  location                                               = var.vm_location
  name                                                   = var.name
  network_interface_ids                                  = [azurerm_network_interface.vm_nic.id]  # Reference the network interface
  resource_group_name                                    = var.resource_group_name  # Reference the resource group
  size                                                   = var.size
  #source_image_id                                        = var.source_image_id

  # Boot diagnostics
  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint
}

  # OS disk settings
  os_disk {
    caching                          = "ReadWrite"  # Set caching to "ReadWrite"
    disk_size_gb                     = var.os_disk_disk_size_gb
    name                             = var.os_disk_name
    storage_account_type             = var.os_disk_storage_account_type
  }

  # Source image reference
  source_image_reference {
    offer     = var.source_image_reference_offer
    publisher = var.source_image_reference_publisher
    sku       = var.source_image_reference_sku
    version   = var.source_image_reference_version
  }
}




