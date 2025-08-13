# Web ACG
resource "ncloud_access_control_group" "web_acg" {
  name   = "web-acg"
  vpc_no = ncloud_vpc.vpc.id
}

resource "ncloud_access_control_group_rule" "web_rule" {
  access_control_group_no = ncloud_access_control_group.web_acg.id

  inbound {
    protocol   = "TCP"
    ip_block   = "10.0.20.0/24" # ALB subnet CIDR
    port_range = "80"
  }

  inbound {
    protocol   = "TCP"
    ip_block   = "0.0.0.0/0"
    port_range = "22"
  }

  outbound {
    protocol   = "TCP"
    ip_block   = "0.0.0.0/0"
    port_range = "1-65535"
  }
}