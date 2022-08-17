resource "azurerm_virtual_network" "k8s" {
  name                = "${var.prefix}-network"
  location            = azurerm_resource_group.k8s.location
  resource_group_name = azurerm_resource_group.k8s.name
  address_space       = ["${var.aks_vnet}"]
}

resource "azurerm_subnet" "k8s" {
  name                 = "${var.prefix}-subnet"
  virtual_network_name = azurerm_virtual_network.k8s.name
  resource_group_name  = azurerm_resource_group.k8s.name
  address_prefixes     = ["${var.aks_subnet}"]
}