resource "ncloud_vpc" "vpc" {
  name            = "vpc"
  ipv4_cidr_block = "10.0.0.0/16"
}

# Server Subnet
resource "ncloud_subnet" "public" {
  name           = "server-pub"
  vpc_no         = ncloud_vpc.vpc.id
  subnet         = "10.0.10.0/24"
  zone           = "KR-1"
  subnet_type    = "PUBLIC"
  usage_type     = "GEN"
  network_acl_no = ncloud_vpc.vpc.default_network_acl_no
}

# ALB 전용 Subnet (Public)
resource "ncloud_subnet" "public_lb" {
  name           = "alb-pub"
  vpc_no         = ncloud_vpc.vpc.id
  subnet         = "10.0.20.0/24"
  zone           = "KR-1"
  subnet_type    = "PUBLIC"
  usage_type     = "LOADB"
  network_acl_no = ncloud_vpc.vpc.default_network_acl_no
}
