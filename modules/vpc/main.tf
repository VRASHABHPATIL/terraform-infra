resource "aws_vpc" "Final-Project" {
  cidr_block = "10.10.0.0/24"
  tags = {
    Name = "Final-Project"
  }

}

resource "aws_subnet" "Project-Public-Subnet-1" {
  vpc_id                  = aws_vpc.Final-Project.id
  cidr_block              = "10.10.0.0/26"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags = {
    Name = "Project-Public-Subnet-1"
  }
}

resource "aws_subnet" "Project-Public-Subnet-2" {
  vpc_id                  = aws_vpc.Final-Project.id
  cidr_block              = "10.10.0.64/26"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1b"
  tags = {
    Name = "Project-Public-Subnet-2"
  }
}

resource "aws_subnet" "Project-Private-Subnet-1" {
  vpc_id            = aws_vpc.Final-Project.id
  cidr_block        = "10.10.0.128/26"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "Project-Private-Subnet-1"
  }
}

resource "aws_subnet" "Project-Private-Subnet-2" {
  vpc_id            = aws_vpc.Final-Project.id
  cidr_block        = "10.10.0.192/26"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "Project-Private-Subnet-2"
  }
}

resource "aws_internet_gateway" "Project-Internet-Gateway" {
  vpc_id = aws_vpc.Final-Project.id
  tags = {
    Name = "Project-Internet-Gateway"
  }

}

resource "aws_route_table" "Project-Internet-facing-Route-Table" {
  vpc_id = aws_vpc.Final-Project.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Project-Internet-Gateway.id
  }
  tags = {
    Name = "Project-Internet-facing-Route-Table"
  }

}

resource "aws_route_table_association" "Project-Internet-facing-Route-Table-Association-1" {
  route_table_id = aws_route_table.Project-Internet-facing-Route-Table.id
  subnet_id      = aws_subnet.Project-Public-Subnet-1.id

}
resource "aws_route_table_association" "Project-Internet-facing-Route-Table-Association-2" {
  route_table_id = aws_route_table.Project-Internet-facing-Route-Table.id
  subnet_id      = aws_subnet.Project-Public-Subnet-2.id

}

resource "aws_route_table" "Private-Route-Table" {
  vpc_id = aws_vpc.Final-Project.id

  tags = {
    Name = "Private-Route-Table"
  }
}

resource "aws_route_table_association" "Private-Route-Table-Association-1" {
  subnet_id      = aws_subnet.Project-Private-Subnet-1.id
  route_table_id = aws_route_table.Private-Route-Table.id
}

resource "aws_route_table_association" "Private-Route-Table-Association-2" {
  subnet_id      = aws_subnet.Project-Private-Subnet-2.id
  route_table_id = aws_route_table.Private-Route-Table.id
}



resource "aws_security_group" "Server_security_group" {
  vpc_id      = aws_vpc.Final-Project.id
  description = "security group created for the virtual private network"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 5001
    to_port     = 5001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description     = "MySQL access from EC2 servers"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name ="Server_security_group"
  }

}

resource "aws_security_group" "RDS_security_group" {
  name        = "RDS_security_group"
  description = "Allow MySQL access from EC2 instances"
  vpc_id      = aws_vpc.Final-Project.id
  depends_on = [ aws_security_group.Server_security_group ]
  ingress {
    description     = "MySQL access from EC2 servers"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.Server_security_group.id]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS_security_group"
  }
}
