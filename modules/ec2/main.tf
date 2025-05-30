
resource "aws_instance" "Project-Server" {

  ami             = var.Operating_system
  key_name        = var.Server_key_name
  subnet_id       = var.Server_subnet_id
  instance_type   = var.Server_type
  security_groups = [var.Server_security_group]

  root_block_device {
    volume_size = var.Server_Volume_size
    volume_type = var.Server_Volume_type
  }

  tags = {
    Name = var.server_name

  }

}