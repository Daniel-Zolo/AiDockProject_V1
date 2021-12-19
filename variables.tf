variable "vpn_endpoint_id_dev" {
  type        = string
  description = "VPC ID for dev environment"
  default     = "vpc-111111111"
}

variable "vpn_endpoint_id_staging" {
  type        = string
  description = "VPC ID for staging environment"
  default     = "vpc-22222222"
}

variable "vpn_endpoint_id_production" {
  type        = string
  description = "VPC ID for production environment"
  default     = "vpc-33333333"
}

variable "vpc_cidr_dev" {
  type        = string
  description = "CIDR for dev VPC"
  default     = "10.64.0.0/16"
}

variable "vpc_cidr_staging" {
  type        = string
  description = "CIDR for staging VPC"
  default     = "10.65.0.0/16"
}

variable "vpc_cidr_production" {
  type        = string
  description = "CIDR for production VPC"
  default     = "10.66.0.0/16"
}

variable "subnet_id_dev" {
  type        = string
  description = "subnet ID for SSO VPN dev"
  default     = "dev-111"
}

variable "subnet_id_staging" {
  type        = string
  description = "subnet ID for SSO VPN staging"
  default     = "staging-222"
}

variable "subnet_id_production" {
  type        = string
  description = "subnet ID for SSO VPN production"
  default     = "production-333"
}

variable "vpn_tags_dev" {
  type = map(string)
  default = {
    Name    = "vpn-vpc-dev"
    billing = "R&D"
  }
}

variable "vpn_tags_staging" {
  type = map(string)
  default = {
    Name    = "vpn-vpc-staging"
    billing = "Product"
  }
}

variable "vpn_tags_production" {
  type = map(string)
  default = {
    Name    = "vpn-vpc-production"
    billing = "Operations"
  }
}
