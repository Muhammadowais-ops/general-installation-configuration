## resource group name for generic
resource_group_name = "testing-rg"

# azure vnet
vnet_name           = "test-vnet"
vnet_location       = "uaenorth"
vnet_address        = ["10.0.0.0/16"]

resource_group_location = "uaenorth"
subnet_names        = ["aks-1", "subnet-2"]
subnet_values       = ["10.0.64.0/18", "10.0.2.0/24"]

# AKS Cluster variables
aks_name            = "test-aks"
location            = "uaenorth"
dns_prefix          = "test-aks-dns"
kubernetes_version  = "1.32.5"
sku_tier            = "Standard"
node_pool_name      = "nodepool"
node_count          = 1
vm_size             = "Standard_D2ps_v6"
os_disk_size        = 128
os_disk_type        = "Managed"
# tags = {
#   environment = "dev"
# }

# AKS Networking settings
aks_dns_ip          = "10.1.0.10"
pod_cidr            = "10.244.0.0/16"
service_cidr        = "10.1.0.0/16"
windows_admin_password = "KKDm!11ytestp111"

 



#####compute azure########


admin_password = "A1!dm.%sktsasdd"
admin_username = "azureuser"
allow_extension_operations = true
computer_name = "test-vm"
disable_password_authentication = false
#encryption_at_host_enabled = false
vm_location="uaenorth"
name = "test-vm"

size = "Standard_B2s"

os_disk_disk_size_gb = 30
os_disk_name = "test-vm_OsDisk_1_2e0151180deb424f932c12453e714ca0"
os_disk_storage_account_type = "StandardSSD_LRS"


source_image_reference_offer = "0001-com-ubuntu-server-jammy"
source_image_reference_publisher = "canonical"
source_image_reference_sku = "22_04-lts-gen2"
source_image_reference_version = "latest"
boot_diagnostics_storage_account_uri = "https://your-storage-account-name.blob.core.windows.net"
create_public_ip=true





#########    azure mysql flexible server #########
administrator_login              = "mysqladmin"
administrator_password           = "111abAm@!22now"
geo_redundant_backup_enabled     = true
mysql_location                   = "uaenorth"
sku_name                         = "GP_Standard_D2ads_v5"
mysql_version                    = "8.0.21"
mysql_name                       = "testmusql111abc"
storage_size_gb                  = "20"



###### azure container registry #####

acr_name                      = "mysnew"      # Unique name for ACR
acr_location                  = "uaenorth"    # Location for ACR (can be changed)
acr_public_network_access_enabled = true
acr_retention_policy_in_days      = 0
acr_sku                           = "Standard"
azure_container_id               = "0"
