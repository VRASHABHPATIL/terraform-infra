variable "vpc_id" {
  description = "The ID of the VPC where the ALB and other resources will be deployed."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID in which to place the Application Load Balancer."
  type        = list(string)
}

variable "instance_ids" {
  description = "A list of EC2 instance IDs to register with the target group."
  type        = list(string)
}

variable "alb_sg_id" {
  description = "Security group ID to associate with the ALB."
  type        = string
}
