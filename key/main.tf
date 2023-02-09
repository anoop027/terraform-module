resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "generated_key" {
  key_name   = "mykeytf"
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
      echo '${tls_private_key.pk.private_key_pem}' > ./mykeytf.pem
      chmod 444 ./mykeytf.pem
    EOT
  }
}
