output "vpc-id" {
  value = aws_vpc.mytfvpc.id
}

output "subnet-id" {
  value = aws_subnet.tfsubnet.id
}
