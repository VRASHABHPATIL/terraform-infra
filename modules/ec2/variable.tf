variable "server_name" {
  description = "provided variable is for defining the server name"
  type        = string

}

variable "Operating_system" {
  description = "this feild is provided to determine the operating system of the Server"
  type        = string
}

variable "Server_subnet_id" {
  description = "to provide the subnet id for the instance"
  type        = string

}

variable "Server_type" {
  description = "this perticular feild is provided for the determination of the server type or instance type to be used"
  type        = string

}

variable "Server_Volume_size" {
  description = "this feild is provided to describe the volume size of the instance"
  type        = string

}

variable "Server_Volume_type" {
  description = "this feild is provided to describe the volume type of the instance"
  type        = string

}

variable "Server_security_group" {
  description = "this feild is provided to get the security group of the Server"

}

variable "Server_key_name" {
  description = "this is provided to determine the key name of the server"

}