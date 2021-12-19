variable "vpn_vpc_peering" {
  type = map(object({
    vpn_endpoint_id = string
    vpc_cidr        = string
    subnet_id       = string
    tags            = map(string)
  }))
  default = {
    "dev" = {
      vpn_endpoint_id = "vpc-111111111"
      vpc_cidr        = "10.64.0.0/16"
      subnet_id       = "dev-111"
      tags = {
        "Name"    = "vpn-vpc-dev"
        "billing" = "R&D"
      }
    }
    "staging" = {
      vpn_endpoint_id = "vpc-22222222"
      vpc_cidr        = "10.65.0.0/16"
      subnet_id       = "staging-222"
      tags = {
        "Name"    = "vpn-vpc-staging"
        "billing" = "product"
      }
    }
    "production" = {
      vpn_endpoint_id = "vpc-33333333"
      vpc_cidr        = "10.66.0.0/16"
      subnet_id       = "prod-333"
      tags = {
        "Name"    = "vpn-vpc-production"
        "billing" = "operations"
      }
    }
  }
}
