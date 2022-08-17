variable "prefix" {
  default = "faceit"
  description = "A prefix to be used for all resources"
}
variable "location" {
  default = "East US"
  description = "Azure region where all resources will be provisioned"
}
variable "worker_nodes" {
  description = "Number of worker nodes to deploy on Cluster"
  default = 3
}
variable "max_nodes" {
  description = "Maximum number of worker nodes allowed on Cluster"
  default = 10
}
variable "size" {
  default = "Standard_D2_v2"
}
variable "pod_cidr" {
    default = "172.168.0.0/16"
}
variable "service_cidr" {
  default = "10.200.0.0/16"
}
variable "docker_bridge_cidr" {
  default = "10.10.0.0/16"
}
variable "dns_service_ip" {
  default = "10.200.0.10"
}

variable "aks_vnet" {
    default = "10.0.0.0/16"
}
variable "aks_subnet" {
    default = "10.0.0.0/22"
}