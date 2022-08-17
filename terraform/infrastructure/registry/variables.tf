variable "prefix" {
  default           = "faceit"
  description       = "A prefix to be used for all resources"
}
variable "storage_account_name" {
  description       = "Remote backend name"
  type              = string
}
variable "location" {
  default           = "East US"
  description       = "Azure region where all resources will be provisioned"
}