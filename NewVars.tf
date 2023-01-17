variable "apps" {

  type = map(object({
    appName     = string
    team        = string
    labels      = map(string)
    annotations = map(string)
    data        = map(string)
    image       = string

  }))
  default = {
    "app1" = {
      appName = "app1"
      team    = "frontend"
      image   = "nginx"

      labels = {
        "name"  = "stream-frontend"
        "tier"  = "web"
        "owner" = "product"
      }

      annotations = {
        "serviceClass"           = "web-frontend"
        "loadBalancer_and_class" = "external"
      }
      data = {
        "aclName"  = "acl_frontend"
        "ingress"  = "stream-frontend"
        "egress"   = "0.0.0.0/0"
        "port"     = "8080"
        "protocol" = "TCP"
      }


    }
    "app2" = {
      appName = "app2"
      team    = "backend"
      image   = "nginx"

      labels = {
        "name"  = "stream-frontend"
        "tier"  = "web"
        "owner" = "product"
      }

      annotations = {
        "serviceClass"           = "web-frontend"
        "loadBalancer_and_class" = "external"
      }
      data = {
        "aclName"  = "acl_backend"
        "ingress"  = "stream-backend"
        "egress"   = "0.0.0.0/0"
        "port"     = "8080"
        "protocol" = "TCP"
      }
    }

    "app3" = {
      appName = "app3"
      team    = "database"
      image   = "mongo"
      labels = {
        "name"  = "stream-database"
        "tier"  = "shared"
        "owner" = "product"
      }

      annotations = {
        "serviceClass"           = "disabled"
        "loadBalancer_and_class" = "disabled"
      }
      data = {
        "aclName"  = "acl_database"
        "ingress"  = "stream-database"
        "egress"   = "172.17.0.0/24"
        "port"     = "27017"
        "protocol" = "TCP"
      }
    }
  }
}