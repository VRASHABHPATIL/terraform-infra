output "Server-Public-Ip" {
  value = aws_instance.Project-Server.public_ip

}

output "serverid" {
  value = aws_instance.Project-Server.id
  
}