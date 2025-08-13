# 키 생성
resource "ncloud_login_key" "this" {
  key_name = "login-key-${formatdate("YYYYMMDDhhmmss", timestamp())}"
}

# private_key 출력 (민감정보라 sensitive 설정)
output "private_key" {
  value     = ncloud_login_key.this.private_key
  sensitive = true
}