output "Vpc-Name" {
  value = aws_vpc.Final-Project.tags.Name

}
output "Server_Public_subnet_id_1" {
  value = aws_subnet.Project-Public-Subnet-1.id

}
output "Server_Public_subnet_id_2" {
  value = aws_subnet.Project-Public-Subnet-2.id
}

output "Server_Private_subnet_id_1" {
  value = aws_subnet.Project-Private-Subnet-1.id

}

output "Server_Private_subnet_id_2" {
  value = aws_subnet.Project-Private-Subnet-2.id

}

output "Server_security_group" {
  value = aws_security_group.Server_security_group.id

}

output "rds_security_group" {
  value = aws_security_group.Server_security_group.id

}
output "vpc_id" {
  value = aws_vpc.Final-Project.id
  
}