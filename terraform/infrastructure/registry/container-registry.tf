provider "azurerm" {
  version = "~>2.0"
  features {}
}

resource "azurerm_container_registry" "registry" {
  name                = "faceitregistry"
  resource_group_name = "${var.prefix}-rg"
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = false
}