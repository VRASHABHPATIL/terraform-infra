module "s3" {
  source = "./modules/S3"
}
module "Secret_SSH_Key" {
  source          = "./modules/key"
  Server_Key_Name = var.Web_Server_Key_Name

}
module "Server_vpc" {
  source = "./modules/vpc"

}

module "Server_instance_1" {
  source                = "./modules/ec2"
  depends_on            = [module.Server_vpc, module.Secret_SSH_Key]
  server_name           = var.server_name_1
  Operating_system      = var.operating_system_1
  Server_key_name       = var.Web_Server_Key_Name
  Server_security_group = module.Server_vpc.Server_security_group
  Server_subnet_id      = module.Server_vpc.Server_Public_subnet_id_1
  Server_type           = var.server_type_1
  Server_Volume_size    = var.server_volume_size_1
  Server_Volume_type    = var.server_volume_type_1

}

module "Server_instance_2" {
  source                = "./modules/ec2"
  depends_on            = [module.Server_vpc, module.Secret_SSH_Key]
  server_name           = var.server_name_2
  Operating_system      = var.operating_system_2
  Server_key_name       = var.Web_Server_Key_Name
  Server_security_group = module.Server_vpc.Server_security_group
  Server_subnet_id      = module.Server_vpc.Server_Public_subnet_id_2
  Server_type           = var.server_type_2
  Server_Volume_size    = var.server_volume_size_2
  Server_Volume_type    = var.server_volume_type_2
}

module "load_balancer" {
  source = "./modules/load_balancer"
  depends_on   = [ module.Secret_SSH_Key, module.Server_vpc, module.Server_instance_1, module.Server_instance_2]
  vpc_id       = module.Server_vpc.vpc_id
  subnet_id    = [module.Server_vpc.Server_Public_subnet_id_1, module.Server_vpc.Server_Public_subnet_id_2]
  instance_ids = [module.Server_instance_2.serverid, module.Server_instance_1.serverid]
  alb_sg_id    = module.Server_vpc.Server_security_group
  
}

module "rds_instance" {
  source                           = "./modules/rds"
  database_identifier              = var.database_identifier
  database_engine                  = var.database_engine
  database_engine_version          = var.database_engine_version
  database_instance_class          = var.database_instance_class
  database_allocated_storage       = var.database_allocated_storage
  database_username                = var.database_username
  database_password                = var.database_password
  database_backup_retention_period = var.database_backup_retention_period
  database_multi_az                = var.database_multi_az
  database_publicly_accessible     = var.database_publicly_accessible
  database_vpc_security_group_ids  = [module.Server_vpc.rds_security_group]
  database_subnet_ids              = [module.Server_vpc.Server_Private_subnet_id_1, module.Server_vpc.Server_Private_subnet_id_2]
}
