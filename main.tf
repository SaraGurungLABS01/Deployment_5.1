############################-PROVIDER BLOCK-#######################################

# configure aws provider
provider "aws" {
  access_key = var.access_key #enter your access key here
  secret_key = var.secret_key
  region     = var.region
  #profile = "Admin"
}

################################-RESOURCE BLOCK-#########################################

###################################-CREATING EC2 INSTANCES-###################################

#EC2 instance 1
resource "aws_instance" "instance_1_dep5_1" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.dep5_1_sg.id]
  subnet_id                   = aws_subnet.D5_1_subnet_1.id
  key_name                    = var.key_name
  associate_public_ip_address = true # Enable Auto-assign public IP

  #user_data = "${file("Jenkins.sh")}"

  tags = {
    "Name" : "instance_1_Dep5_1"
  }

}

#EC2 instance 2

resource "aws_instance" "instance_2_dep5_1" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.dep5_1_sg.id]
  subnet_id                   = aws_subnet.D5_1_subnet_2.id
  key_name                    = var.key_name
  associate_public_ip_address = true # Enable Auto-assign public IP

  #user_data = "${file("pyt.sh")}"

  tags = {
    "Name" : "instance_2_dep5_1"
  }

}

#EC2 instance 3

resource "aws_instance" "instance_3_dep5_1" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.dep5_1_sg.id]
  subnet_id                   = aws_subnet.D5_1_subnet_1.id
  key_name                    = var.key_name
  associate_public_ip_address = true # Enable Auto-assign public IP



  tags = {
    "Name" : "instance_3_Dep5_1"
  }

}


######################################-VPC-###############################################

#create vpc

resource "aws_vpc" "VPC_Dep5_1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Dep5_1_VPC"
  }
}

######################################3-AVAILABILITY ZONES ##################################################

#create 2 availability zone

#resource "aws_ec2_availability_zone_group" "availability_zone1" {
#group_name    = "us-east-1a"
#opt_in_status = "opted-in"
#}

#resource "aws_ec2_availability_zone_group" "availability_zone2" {
#group_name    = "us-east-1b"
#opt_in_status = "opted-in"
#}


#######################################-SUBNETS-######################################################

#create 2 subnets

# Subnet-1

resource "aws_subnet" "D5_1_subnet_1" {
  vpc_id            = aws_vpc.VPC_Dep5_1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.availability_zone_1

  tags = {
    Name = "Main1_D5.1"
  }
}

#Subnet-2

resource "aws_subnet" "D5_1_subnet_2" {
  vpc_id            = aws_vpc.VPC_Dep5_1.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.availability_zone_2

  tags = {
    Name = "Main2_D5.1"
  }
}

##################################-SECURITY GROUPS-#######################################

# create security groups

#Security Group 

resource "aws_security_group" "dep5_1_sg" {
  vpc_id = aws_vpc.VPC_Dep5_1.id


  ingress {
    description = "allow incoming SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow incoming traffic on port 8080"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow incoming traffic on port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    "Name" : "tf_D5_1_sg"
    "Terraform" : "true"
  }

}

#############################-INTERNET GATEWAY-####################################

#create internet gateway

resource "aws_internet_gateway" "Dep5_1_gw" {
  vpc_id = aws_vpc.VPC_Dep5_1.id

  tags = {
    Name = "IGW_D5.1"
  }
}

#############################- ROUTE TABLE-######################################

#create route table

############################################3
#resource "aws_route_table" "Dep5_route_table" {
#vpc_id = aws_vpc.VPC_Dep5.id

#route = []

#tags = {
#Name = "D5_route_table"
#}
#}

##########################################################################

resource "aws_default_route_table" "Dep5_1_RT" {
  default_route_table_id = aws_vpc.VPC_Dep5_1.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Dep5_1_gw.id
  }
}




################################-OUTPUT BLOCK-##########################################

output "instance_ip_1" {
  value = aws_instance.instance_1_dep5_1.public_ip
}

output "instance_ip_2" {
  value = aws_instance.instance_2_dep5_1.public_ip
}

output "instance_ip_3" {
  value = aws_instance.instance_3_dep5_1.public_ip
}

