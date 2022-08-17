provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "k8s" {
  name     = "${var.prefix}-rg"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "${var.prefix}-aks"
  location            = azurerm_resource_group.k8s.location
  resource_group_name = azurerm_resource_group.k8s.name
  dns_prefix          = "${var.prefix}-aks"

  default_node_pool {
    name                = "workerpool1"
    node_count          = var.worker_nodes
    vm_size             = var.size
    type                = "VirtualMachineScaleSets"
    availability_zones  = ["1", "2", "3"]
    enable_auto_scaling = true
    min_count           = var.worker_nodes
    max_count           = var.max_nodes

    # Required for advanced networking
    vnet_subnet_id = azurerm_subnet.k8s.id
  }
  
  identity {
    type = "SystemAssigned"
  }
  network_profile {
    network_plugin      = "kubenet"
    load_balancer_sku   = "standard"
    network_policy      = "calico"
    pod_cidr            = var.pod_cidr
    service_cidr        = var.service_cidr
    dns_service_ip      = var.dns_service_ip
    docker_bridge_cidr  = var.docker_bridge_cidr
  }

  tags = {
    Environment = "Production"
  }
}