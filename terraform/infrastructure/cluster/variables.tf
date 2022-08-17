variable "prefix" {
  description       = "A prefix to be used for all resources"
  default           = "faceit"
}
variable "storage_account_name" {
  description       = "Remote backend name"
  type              = string
}
variable "location" {
  description       = "Azure region where all resources will be provisioned"
  default           = "East US"
}
variable "worker_nodes" {
  description       = "Number of worker nodes to deploy on Cluster"
  default           = 3
}
variable "max_nodes" {
  description       = "Maximum number of worker nodes allowed on Cluster"
  default           = 10
}
variable "size" {
  description       = "Azure VM size name"
  default           = "Standard_D2_v2"
}
variable "pod_cidr" {
  description       = "AKS PODs cidr"
  default           = "172.168.0.0/16"
}
variable "service_cidr" {
  description       = "AKS Service cidr"
  default           = "10.200.0.0/16"
}
variable "docker_bridge_cidr" {
  description       = "AKS Docker bridge cidr"
  default           = "10.10.0.0/16"
}
variable "dns_service_ip" {
  description       = "AKS DNS service IP"
  default           = "10.200.0.10"
}
variable "aks_vnet" {
  description       = "AKS Virtual network cidr"
  default           = "10.0.0.0/16"
}
variable "aks_subnet" {
  description       = "AKS subnet cidr"
  default           = "10.0.0.0/22"
}