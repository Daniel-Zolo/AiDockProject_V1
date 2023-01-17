############# random password #############
resource "random_password" "pass" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

############# the deployment section #############
resource "kubernetes_deployment" "dep_apps" {
  for_each = var.apps
  metadata {
    name      = each.value.appName
    namespace = each.value.appName
    labels = {
      name = each.value.labels.name
      tier = each.value.labels.tier
    }
  }
  spec {
    replicas = 3
    strategy {
      type = "RollingUpdate"

      rolling_update {
        max_surge       = "25%"
        max_unavailable = "25%"
      }
    }
    selector {
      match_labels = {
        name = each.value.labels.name
        tier = each.value.labels.tier
      }
    }
    template {
      metadata {
        name      = each.value.appName
        namespace = each.value.appName
        labels = {
          name = each.value.labels.name
          tier = each.value.labels.tier
        }
      }

      spec {
        container {
          name  = each.value.appName
          image = each.value.image
          ##didn't had a real instance to put a random db pass on it so i just placed it inside the deployment
          env {
            name  = "db_pass"
            value = random_password.pass.result
          }
          resources {
            limits = {
              cpu    = "500m"
              memory = "512Mi"
            }
            requests = {
              cpu    = "200m"
              memory = "256Mi"
            }
          }
        }
      }
    }
  }
}
############# the replica section #############
resource "kubernetes_horizontal_pod_autoscaler_v1" "autoscaler" {
  for_each = var.apps
  metadata {
    name      = "${each.value.appName}-as"
    namespace = each.value.appName
    labels = {
      name = each.value.labels.name
      tier = each.value.labels.tier
    }
  }
  spec {
    scale_target_ref {
      api_version = "apps/v1"
      kind        = "ReplicaSet"
      name        = each.value.appName
    }
    min_replicas = 1
    max_replicas = 10
  }
}
############# the loadbalancer section #############
resource "kubernetes_service" "load_balancer" {
  for_each = toset([for app in var.apps : app if app.appName == ["app1", "app2"]])
  metadata {
    name = "${each.value.appName}-lb"
    labels = {
      name = each.value.labels.name
      tier = each.value.labels.tier
    }
  }
  spec {
    selector = {
      app = each.value.appName
    }
    port {
      name        = "http"
      port        = 80
      target_port = 8080
    }
    type = "LoadBalancer"
  }
}