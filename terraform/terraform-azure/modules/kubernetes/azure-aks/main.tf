resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = "${var.kubernetes_version}"
  sku_tier            = "${var.sku_tier}"
  role_based_access_control_enabled = true

  default_node_pool {
    auto_scaling_enabled  = true
    name                  = var.node_pool_name
    node_count            = var.node_count
    max_count             = 1
    min_count             = 1
    vm_size               = var.vm_size
    vnet_subnet_id        = var.subnet_id  # This is where you're passing the subnet_id
    os_disk_size_gb       = var.os_disk_size
    os_disk_type          = var.os_disk_type
    orchestrator_version  = var.kubernetes_version
    os_sku                = "Ubuntu"
    type                  = "VirtualMachineScaleSets"
    zones                 = ["1", "2", "3"]
  }

  network_profile {
    dns_service_ip      = var.aks_dns_ip
    ip_versions         = ["IPv4"]
    load_balancer_sku   = "standard"
    network_data_plane  = "azure"
    # network_mode        = ""
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    # network_policy      = "None"
    outbound_type       = "loadBalancer"
    pod_cidr            = var.pod_cidr
    pod_cidrs           = [var.pod_cidr]
    service_cidr        = var.service_cidr
    service_cidrs       = [var.service_cidr]
    load_balancer_profile {
      # backend_pool_type           = "NodeIPConfiguration"
      idle_timeout_in_minutes     = 4
    }
  }

  identity {
    type = "SystemAssigned"
  }

  windows_profile {
    admin_password = var.windows_admin_password
    admin_username = "azureuser"
    # license        = ""
  }

  tags = "${var.tags}"
}


resource "azurerm_role_assignment" "acr_pull_role" {
  principal_id                  = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id  # Correct reference to AKS managed identity
  role_definition_name          = "AcrPull"  # Role for pulling images from ACR
  scope                         = var.azure_container_id  # Correct reference to your ACR resource
  skip_service_principal_aad_check = true  # This option skips the service principal AAD check if needed
}