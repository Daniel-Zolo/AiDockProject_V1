#############################################################################
### Resource manifests for 3 namespaces reusing the application naming    ###
### feel free to change anything and to implement any function or method  ###
#############################################################################

resource "kubernetes_namespace" "app" {
  for_each = var.apps
  metadata {
    name = each.value.appName
    labels = {
      name  = each.value.labels.name
      tier  = each.value.labels.tier
      owner = each.value.labels.owner
    }
    annotations = {
      "serviceClass"           = each.value.annotations.serviceClass
      "loadBalancer_and_class" = each.value.annotations.loadBalancer_and_class
    }
  }
}