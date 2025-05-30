resource "aws_key_pair" "Project-server-key" {
  key_name   = var.Server_Key_Name
  public_key = file("${path.module}/serverkey.pub")
}