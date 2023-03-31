resource "aws_key_pair" "devkey" {
  key_name   = "devkey"
  public_key = file(var.PUB_KEY_PATH)
}
