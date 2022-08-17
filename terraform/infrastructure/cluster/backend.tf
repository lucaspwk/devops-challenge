terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstate5oizn"
    container_name       = "tfstate-container"
    key                  = "azure/faceit-challenge/aks.tfstate"
  }
}