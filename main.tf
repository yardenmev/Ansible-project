resource "aws_instance" "master" {

  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.master.id]
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.subnets, 1).id
  associate_public_ip_address = true
  user_data                   = "${file("Installing Ansible.sh")}"
  tags = {
    Name = "yarden-Ansible-master"
  }
}
resource "aws_security_group" "master" {
  name   = "yarden-master-SG"
  vpc_id = aws_vpc.main.id
  ingress {
    description = "ssh to master"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress  {
    description     = "connect to internet"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "yarden-master-SG"
  }
}
resource "aws_instance" "clients" {

  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.clients.id]
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.subnets, count.index).id
  associate_public_ip_address = true
  # user_data                   = count.index == 0 ? "${file("Installing Ansible.sh")}" : ""
  count = var.clients
  tags = {
    Name = "yarden-client-${count.index +1}"
  }
}
resource "aws_security_group" "clients" {
  name   = "yarden-clients-SG"
  vpc_id = aws_vpc.main.id
  ingress {
    description = "ssh to clients"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "http to clients"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress  {
    description     = "master to client"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.master.id]
  }
  egress  {
    description     = "connect to internet"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "yarden-clients-SG"
  }
}
data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "yarden VPC"
  }
}
resource "aws_subnet" "subnets" {
  count = length(data.aws_availability_zones.available.names)
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.${count.index +1}.0/24"
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "subnet ${count.index +1}"
  }
}
resource "aws_route_table_association" "rta" {
  count = length(data.aws_availability_zones.available.names)
  subnet_id      =  element(aws_subnet.subnets, count.index).id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.GW.id
  }
  tags = {
    Name = "yarden-route"
  }
}
resource "aws_internet_gateway" "GW" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "yarden-GW"
  }
}