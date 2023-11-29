resource "azurerm_resource_group" "ResourceGroup" {
    name        = var.rgname
    location    = var.location
    tags        = var.tags
  }