output "boot_diagnostics_storage_account_uri" {
  description = "The URI of the storage account used for boot diagnostics."
  value       = azurerm_storage_account.my_storage_account.primary_blob_endpoint  # Correct reference
}