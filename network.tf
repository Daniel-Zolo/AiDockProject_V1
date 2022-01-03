#################################################################################
### Resource manifests for 3 network policies (one per application namespace) ###
### feel free to change anything and to implement any fix, function or method ###
#################################################################################

resource "kubernetes_network_policy" "app1" {
  metadata {
    name      = format("%s-acl", var.app1_name)
    namespace = var.app1_name
  }
  spec {
    policy_types = ["Ingress", "Egress"]
    pod_selector {
      match_labels = {
        tier = "web"
      }
    }
    ingress {
      from {
        namespace_selector {
          match_labels = {
            name = var.acl_frontend["frontend"]["ingress"]
          }
        }
      }
      ports {
        port     = var.acl_frontend["frontend"]["port"]
        protocol = var.acl_frontend["frontend"]["protocol"]
      }
    }
    egress {
      to {
        ip_block {
          cidr = var.acl_frontend["frontend"]["egress"]
        }
      }
    }
  }
}

resource "kubernetes_network_policy" "app2" {
  metadata {
    name      = format("%s-acl", var.app2_name)
    namespace = "stream-backend"
  }
  spec {
    policy_types = ["Ingress", "Egress"]
    pod_selector {
      match_labels = {
        tier = "api"
      }
    }
    ingress {
      from {
        namespace_selector {
          match_labels = {
            name = var.acl_backend["backend"]["ingress"]
          }
        }
      }
      ports {
        port     = var.acl_backend["backend"]["port"]
        protocol = var.acl_backend["backend"]["protocol"]
      }
    }
    egress {
      to {
        ip_block {
          cidr = var.acl_frontend["frontend"]["egress"]
        }
      }
    }
  }
}

resource "kubernetes_network_policy" "app3" {
  metadata {
    name      = format("%s-acl", var.app3_name)
    namespace = var.app3_name
  }
  spec {
    policy_types = ["Ingress", "Egress"]
    pod_selector {
      match_expressions {
        key      = "name"
        operator = "In"
        values   = [var.app3_name]
      }
    }
    ingress {
      from {
        namespace_selector {
          match_labels = {
            name = var.acl_database["database"]["ingress"]
          }
        }
      }
      ports {
        port     = var.acl_database["database"]["port"]
        protocol = var.acl_database["database"]["protocol"]
      }
    }
    egress {
      to {
        ip_block {
          cidr = var.acl_database["database"]["egress"]
        }
      }
    }
  }
}
