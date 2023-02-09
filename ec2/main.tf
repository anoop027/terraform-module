resource "aws_instance" "server4" {
  ami                         = var.amiid
  instance_type               = var.type
  subnet_id                   = var.subnetid
  vpc_security_group_ids      = ["${var.grpid}"]
  associate_public_ip_address = true
  key_name                    = "mykeytf"

  tags = {
    Name = "tfserver8"
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("/home/ubuntu/terraform2/mykeytf.pem")
    host     = aws_instance.server4.public_ip
  }

  provisioner "file" {
    source      = "/home/ubuntu/terraform2/run.sh"
    destination = "/home/ubuntu/run.sh"
  }

  provisioner "file" {
    source      = "/home/ubuntu/terraform2/tomcat.service"
    destination = "/home/ubuntu/tomcat.service"
  }

  provisioner "remote-exec" {
    inline = [
      "cd /home/ubuntu",
      "sudo chmod 777 run.sh",
      "sudo chmod 777 tomcat.service",
      "./run.sh",
    ]
 }
}
