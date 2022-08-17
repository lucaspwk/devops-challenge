terraform {

  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstate5oizn"
    container_name       = "tfstate-container"
    key                  = "azure/faceit-challenge/app.tfstate"
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "faceit-aks"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }

}

