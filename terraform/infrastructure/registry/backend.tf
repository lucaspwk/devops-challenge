terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = var.storage_account_name
    container_name       = "tfstate-container"
    key                  = "azure/faceit-challenge/registry.tfstate"
  }
}