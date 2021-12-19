# Routes for AWS peered VPCs
resource "aws_ec2_client_vpn_route" "vpn_route_1" {
  client_vpn_endpoint_id = var.vpn_endpoint_id_dev
  destination_cidr_block = var.vpc_cidr_dev
  target_vpc_subnet_id   = var.subnet_id_dev
  description            = var.vpn_tags_dev.Name
}

resource "aws_ec2_client_vpn_route" "vpn_route_2" {
  client_vpn_endpoint_id = var.vpn_endpoint_id_staging
  destination_cidr_block = var.vpc_cidr_staging
  target_vpc_subnet_id   = var.subnet_id_staging
  description            = var.vpn_tags_staging.Name
}

resource "aws_ec2_client_vpn_route" "vpn_route_3" {
  client_vpn_endpoint_id = var.vpn_endpoint_id_production
  destination_cidr_block = var.vpc_cidr_production
  target_vpc_subnet_id   = var.subnet_id_production
  description            = var.vpn_tags_production.Name
}