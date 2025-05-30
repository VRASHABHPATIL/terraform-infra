variable "server_name_1" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "operating_system_1" {
  description = "AMI ID or operating system name to use for the EC2 instance"
  type        = string
}



variable "server_type_1" {
  description = "EC2 instance type (e.g., t2.micro)"
  type        = string
}

variable "server_volume_size_1" {
  description = "Size of the root volume in GB"
  type        = number
}

variable "server_volume_type_1" {
  description = "Type of volume to attach (e.g., gp2, gp3)"
  type        = string
}


variable "server_name_2" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "operating_system_2" {
  description = "AMI ID or operating system name to use for the EC2 instance"
  type        = string
}


variable "server_type_2" {
  description = "EC2 instance type (e.g., t2.micro)"
  type        = string
}

variable "server_volume_size_2" {
  description = "Size of the root volume in GB"
  type        = number
}

variable "server_volume_type_2" {
  description = "Type of volume to attach (e.g., gp2, gp3)"
  type        = string
}

variable "Web_Server_Key_Name" {
  description = "Created for determining the server key name"
  type        = string

}


# Rds variables 

variable "database_identifier" {
  type        = string
  description = "Unique name for the RDS database instance."
}

variable "database_engine" {
  type        = string
  description = "The database engine to use (e.g., mysql, postgres)."
}

variable "database_engine_version" {
  type        = string
  description = "The version of the database engine to use."
}

variable "database_instance_class" {
  type        = string
  description = "The instance class for the RDS database (e.g., db.t3.micro)."
}

variable "database_allocated_storage" {
  type        = number
  description = "The size of the storage in GB."
}

variable "database_username" {
  type        = string
  description = "Master username for the RDS database."
}

variable "database_password" {
  type        = string
  description = "Master password for the RDS database."
}

variable "database_backup_retention_period" {
  type        = number
  description = "The number of days to retain backups. Use 0 to disable."
}

variable "database_multi_az" {
  type        = bool
  description = "Specifies if the RDS instance is multi-AZ."
}

variable "database_publicly_accessible" {
  type        = bool
  description = "Indicates whether the DB instance is publicly accessible."
}


