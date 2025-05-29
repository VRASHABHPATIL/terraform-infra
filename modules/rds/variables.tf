variable "database_identifier" {
  description = "The name of the RDS instance"
  type        = string
}

variable "database_engine" {
  description = "The database engine to use (e.g., mysql)"
  type        = string
  default     = "mysql"
}

variable "database_engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "8.0"
}

variable "database_instance_class" {
  description = "The instance class to use (e.g., db.t2.micro)"
  type        = string
  default     = "db.t2.micro"
}

variable "database_username" {
  description = "Master username for the database"
  type        = string
}

variable "database_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "database_subnet_ids" {
  description = "List of subnet IDs for the database"
  type        = list(string)
}

variable "database_allocated_storage" {
  description = "The allocated storage size in GB"
  type        = number
  default     = 20
}

variable "database_backup_retention_period" {
  description = "Backup retention period in days"
  type        = number
  default     = 7
}

variable "database_multi_az" {
  description = "Enable Multi-AZ deployment"
  type        = bool
  default     = false
}

variable "database_publicly_accessible" {
  description = "Whether the database is publicly accessible"
  type        = bool
  default     = false
}

variable "database_vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the DB instance"
  type        = list(string)
  default     = []
}
