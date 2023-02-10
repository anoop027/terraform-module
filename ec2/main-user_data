resource "aws_instance" "server11" {
  ami                         = var.amiid
  instance_type               = var.type
  subnet_id                   = var.subnetid
  vpc_security_group_ids      = ["${var.grpid}"]
  associate_public_ip_address = true
  key_name                    = "mykeytf"
  user_data = <<-EOF
              #!/bin/bash
              sudo apt -y install default-jdk
              udo useradd -m -U -d /opt/tomcat -s /bin/false tomcat
              sudo apt -y install unzip wget
              cd /tmp
              wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.85/bin/apache-tomcat-8.5.85.zip
              unzip apache-tomcat-*.zip
              sudo mkdir -p /opt/tomcat
              sudo mv apache-tomcat-8.5.85 /opt/tomcat/
              sudo ln -s /opt/tomcat/apache-tomcat-8.5.85 /opt/tomcat/latest
              sudo chown -R tomcat: /opt/tomcat
              sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'
              sudo sh -c '/opt/tomcat/latest/bin/startup.sh'
              cd
              wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war
              sudo cp sample.war /opt/tomcat/latest/webapps
              EOF
  tags = {
    Name = "tfserver16"
  }
}
