
resource "helm_release" "test-app" {
  name        = "test-app-chart"
  namespace   = var.namespace
  version     = "1.0.0"
  chart       = "./test-app-chart"
  repository  = "https://charts.bitnami.com/bitnami"
  
  values = [
    templatefile("./test-app-chart/values.yaml", {
      db_name      = var.db_name
      db_username  = var.db_username
      db_password  = var.db_password
      replicas     = var.replicas
    })
  ]
}