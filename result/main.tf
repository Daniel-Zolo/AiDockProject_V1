# Routes for AWS peered VPCs
resource "aws_ec2_client_vpn_route" "vpn_routing" {
  for_each               = var.vpn_vpc_peering
  client_vpn_endpoint_id = each.value["vpn_endpoint_id"]
  destination_cidr_block = each.value["vpc_cidr"]
  target_vpc_subnet_id   = each.value["subnet_id"]
  # description alternative for "key=value, key=value"
  description            = join(",", [format("Name=%s", each.value["tags"]["Name"])], [format("billing=%s", each.value["tags"]["billing"])])
  # description function for "value, value"
  #description            = join(",", [each.value["tags"]["Name"]], [each.value["tags"]["billing"]])
}
