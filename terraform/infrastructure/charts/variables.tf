variable "namespace" {
    description = "Kubernetes namespace"
    type        = string
    default     = "test-app"
}
variable "db_name" {
    description = "Postgresql database name"
    type        = string
    sensitive   = true
}
variable "db_username" {
    description = "Postgresql database username"
    type        = string
    sensitive   = true
}
variable "db_password" {
    description = "Postgresql database password"
    type        = string
    sensitive   = true
}
variable "replicas_test-app" {
    description = "Number of replicas for test-app"
    type        = number
    default     = 3
}
variable "backend_name" {
    description = "Storage account name"
    type        = string
}