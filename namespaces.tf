#############################################################################
### Resource manifests for 3 namespaces reusing the application naming    ###
### feel free to change anything and to implement any function or method  ###
#############################################################################

resource "kubernetes_namespace" "app1" {
  metadata {
    name = var.app1_name
    labels = {
      name  = var.app1_labels.name
      tier  = var.app1_labels.tier
      owner = var.app1_labels.owner
    }
    annotations = {
      "serviceClass"       = var.app1_annotations.serviceClass
      "loadBalancer/class" = true
    }
  }
}

resource "kubernetes_namespace" "app2" {
  metadata {
    name = var.app2_name
    labels = {
      name  = var.app2_labels.name
      tier  = var.app2_labels.tier
      owner = var.app2_labels.owner
    }
    annotations = {
      "serviceClass"       = var.app2_annotations.serviceClass
      "loadBalancer/class" = true
    }
  }
}

resource "kubernetes_namespace" "app3" {
  metadata {
    name = var.app3_name
    labels = {
      name  = var.app3_labels.name
      tier  = var.app3_labels.tier
      owner = var.app3_labels.owner
    }
    annotations = {
      "serviceClass"       = var.app3_annotations.serviceClass
      "loadBalancer/class" = false
    }
  }
}