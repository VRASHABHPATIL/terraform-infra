#Variable for the SSH key
Web_Server_Key_Name = "ServerKey"

# Variables for Server_instance_1
server_name_1        = "WebServer1"
operating_system_1   = "ami-06b6e5225d1db5f46"
server_type_1        = "t2.micro"
server_volume_size_1 = 10
server_volume_type_1 = "gp2"

# Variables for Server_instance_2
server_name_2        = "WebServer2"
operating_system_2   = "ami-06b6e5225d1db5f46"
server_type_2        = "t2.micro"
server_volume_size_2 = 10
server_volume_type_2 = "gp2"

#Rds variables
database_identifier              = "finalprojectdb"
database_engine                  = "mysql"
database_engine_version          = "8.0.35"
database_instance_class          = "db.t3.micro"
database_allocated_storage       = 20
database_username                = "admin"
database_password                = "Vrashabh1234"
database_backup_retention_period = 0
database_multi_az                = false
database_publicly_accessible     = false


