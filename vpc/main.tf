#Create VPC
resource "aws_vpc" "mytfvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "mytfvpclatest"
  }
}

resource "aws_internet_gateway" "mygw" {
  vpc_id = aws_vpc.mytfvpc.id

  tags = {
    Name = "mygwlatest"
  }
}

resource "aws_subnet" "tfsubnet" {
  vpc_id                  = aws_vpc.mytfvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "tfsubnetlatest"
  }
}

resource "aws_route_table" "tf-public1" {
  vpc_id = aws_vpc.mytfvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mygw.id
  }
}

resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = aws_subnet.tfsubnet.id
  route_table_id = aws_route_table.tf-public1.id
}
