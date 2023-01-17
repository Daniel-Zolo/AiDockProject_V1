
resource "kubernetes_network_policy" "apps" {
  for_each = var.apps
  metadata {
    name      = "${each.value["appName"]}-acl"
    namespace = each.value.appName
  }
  spec {
    policy_types = ["Ingress", "Egress"]
    pod_selector {
      match_labels = {
        tier = each.value.labels.tier
      }
    }
    ingress {
      from {
        namespace_selector {
          match_labels = {
            name = each.value.data.ingress
          }
        }
      }
      ports {
        port     = each.value.data.port
        protocol = each.value.data.protocol
      }
    }
    egress {
      to {
        ip_block {
          cidr = each.value.data.egress
        }
      }
    }
  }
}