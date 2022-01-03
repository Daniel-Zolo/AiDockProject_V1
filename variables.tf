### namespace variables for app1

variable "app1_name" {
  type        = string
  description = "exposed app name"
  default     = "stream-frontend"
}

variable "app1_labels" {
  type        = map(string)
  description = "labels for namespace app1"
  default = {
    "name"  = "stream-frontend"
    "tier"  = "web"
    "owner" = "product"
  }
}

variable "app1_annotations" {
  type        = map(string)
  description = "annotations for namespace app1"
  default = {
    "serviceClass"       = "web-frontend"
    "loadBalancer/class" = "external"
  }
}

### namespace variables for app2

variable "app2_name" {
  type        = string
  description = "exposed app name"
  default     = "stream-backend"
}

variable "app2_labels" {
  type        = map(string)
  description = "labels for namespace app2"
  default = {
    "name"  = "stream-backend"
    "tier"  = "api"
    "owner" = "product"
  }
}

variable "app2_annotations" {
  type        = map(string)
  description = "annotations for namespace app2"
  default = {
    "serviceClass"       = "web-backend"
    "loadBalancer/class" = "internal"
  }
}

### namespace variables for app3

variable "app3_name" {
  type        = string
  description = "exposed app name"
  default     = "stream-database"
}

variable "app3_labels" {
  type        = map(string)
  description = "labels for namespace app3"
  default = {
    "name"  = "stream-database"
    "tier"  = "shared"
    "owner" = "product"
  }
}

variable "app3_annotations" {
  type        = map(string)
  description = "annotations for namespace app3"
  default = {
    "serviceClass"       = "database"
    "loadBalancer/class" = "disabled"
  }
}

variable "acl_frontend" {
  description = "access allowed from this source"
  type = map(object({
    ingress  = string
    egress   = string
    port     = string
    protocol = string
  }))
  default = {
    frontend = {
      ingress  = "stream-backend"
      egress   = "0.0.0.0/0"
      port     = "80"
      protocol = "TCP"
    }
  }
}

variable "acl_backend" {
  description = "access allowed from this source"
  type = map(object({
    ingress = string
    egress  = string
    port     = string
    protocol = string
  }))
  default = {
    backend = {
      ingress  = "stream-frontend"
      egress   = "172.17.0.0/24"
      port     = "80"
      protocol = "TCP"

    }
  }
}

variable "acl_database" {
  description = "access allowed from this source"
  type = map(object({
    ingress = string
    egress  = string
    port     = string
    protocol = string
  }))
  default = {
    database = {
      ingress  = "stream-backend"
      egress   = "172.17.0.0/24"
      port     = "27017"
      protocol = "TCP"
    }
  }
}
