resource "ncloud_lb" "external_lb" {
  name           = "external-alb"
  network_type   = "PUBLIC"
  type           = "APPLICATION"
  subnet_no_list = [ncloud_subnet.public_lb.id]
}

# external lb target group
resource "ncloud_lb_target_group" "ex_lb_target_group" {
  vpc_no      = ncloud_vpc.vpc.id
  protocol    = "HTTP"
  target_type = "VSVR"
  port        = 80
  health_check {
    protocol       = "HTTP"
    http_method    = "GET"
    port           = 80
    url_path       = "/health"
    cycle          = 30
    up_threshold   = 2
    down_threshold = 2
  }
  algorithm_type = "RR"
}

# external lb listener
resource "ncloud_lb_listener" "ex_lb_listener" {
  load_balancer_no = ncloud_lb.external_lb.id
  protocol         = "HTTP"
  port             = 80
  target_group_no  = ncloud_lb_target_group.ex_lb_target_group.id
}

# external lb target group attachment
resource "ncloud_lb_target_group_attachment" "ex_lb_target_group_attach" {
  target_group_no = ncloud_lb_target_group.ex_lb_target_group.target_group_no
  target_no_list  = [ncloud_server.public_server.id]
}