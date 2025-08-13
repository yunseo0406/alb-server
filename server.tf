resource "ncloud_server" "public_server" {
  subnet_no                 = ncloud_subnet.public.id
  name                      = "public-server"
  server_image_number       = "23214590" # ubuntu 22.04-base
  server_spec_code          = "s2-g3"
  login_key_name            = ncloud_login_key.this.key_name
}

resource "ncloud_public_ip" "public_ip" {
  server_instance_no = ncloud_server.public_server.id
}