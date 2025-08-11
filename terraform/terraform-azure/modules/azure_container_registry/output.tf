output "id" {
  description = "The ID of the Azure Container Registry."
  value       = azurerm_container_registry.container.id  # Correct reference to ACR ID
}

