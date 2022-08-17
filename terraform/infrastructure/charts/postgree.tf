resource "kubernetes_namespace" "ns" {
  metadata {
    name = "test-app"
  }
}

resource "helm_release" "postgresql" {
  name        = "postgresql"
  namespace   = var.namespace
  version     = "11.7.1"
  chart       = "postgresql"
  repository  = "https://charts.bitnami.com/bitnami"
  
  values = [
    templatefile("./values.yaml", {
      db_name      = var.db_name
      db_username  = var.db_username
      db_password  = var.db_password
    })
  ]
}

resource "kubernetes_horizontal_pod_autoscaler" "postgresql-primary" {
  metadata {
    name = "hpa-postgresql-primary"
    namespace = "test-app"
  }

  spec {
    max_replicas = 10
    min_replicas = 1
    target_cpu_utilization_percentage = 60

    scale_target_ref {
      kind = "StatefulSet"
      name = "postgresql-primary"
    }
  }
}

resource "kubernetes_horizontal_pod_autoscaler" "postgresql-read" {
  metadata {
    name = "hpa-postgresql-read"
    namespace = "test-app"
  }

  spec {
    max_replicas = 10
    min_replicas = 1
    target_cpu_utilization_percentage = 60

    scale_target_ref {
      kind = "StatefulSet"
      name = "postgresql-read"
    }
  }
}