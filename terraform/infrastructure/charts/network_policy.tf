resource "kubernetes_namespace" "ns" {
  metadata {
    name = "test-app"
  }
}

resource "kubernetes_network_policy" "example" {
  metadata {
    name      = "deny-from-other-ns"
    namespace = "default"
  }

  spec {
    policy_types = ["Ingress", "Egress"]
    pod_selector {}
    
    ingress {
      from {
        namespace_selector {
          match_labels = {
            "kubernetes.io/metadata.name" = "test-app"
          }
        }
      }
    }
    egress {
      to {
        namespace_selector {
          match_labels = {
            "kubernetes.io/metadata.name" = "test-app"
          }
        }
      }
      to {
        # dns resolution
        namespace_selector {
          match_labels = {
            "kubernetes.io/metadata.name" = "kube-system"
          }
        }
      }
    }
  }
  
}