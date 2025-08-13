# 키 생성
resource "ncloud_login_key" "this" {
  key_name = "login-key-${formatdate("YYYYMMDDhhmmss", timestamp())}"
}

output "private_key" {
  value     = ncloud_login_key.this.private_key
  sensitive = true
}