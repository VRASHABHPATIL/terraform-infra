resource "aws_db_subnet_group" "database_subnet_group" {
  name       = "database_subnet_group"
  subnet_ids = var.database_subnet_ids

  tags = {
    Name = "database_subnet_group"
  }
}

resource "aws_db_instance" "database_instance" {
  identifier              = var.database_identifier
  engine                  = var.database_engine
  engine_version          = var.database_engine_version
  instance_class          = var.database_instance_class
  allocated_storage       = var.database_allocated_storage
  username                = var.database_username
  password                = var.database_password
  db_subnet_group_name    = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids  = var.database_vpc_security_group_ids
  backup_retention_period = var.database_backup_retention_period
  multi_az                = var.database_multi_az
  publicly_accessible     = var.database_publicly_accessible
  skip_final_snapshot     = true

  tags = {
    Name = var.database_identifier
  }
}
