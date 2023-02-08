sudo apt -y install default-jdk
sudo useradd -m -U -d /opt/tomcat -s /bin/false tomcat
sudo apt -y install unzip wget
cd /tmp
wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.85/bin/apache-tomcat-8.5.85.zip
unzip apache-tomcat-*.zip
sudo mkdir -p /opt/tomcat
sudo mv apache-tomcat-8.5.85 /opt/tomcat/
sudo ln -s /opt/tomcat/apache-tomcat-8.5.85 /opt/tomcat/latest
sudo chown -R tomcat: /opt/tomcat
sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'
sudo cp /home/ubuntu/tomcat.service /etc/systemd/system/tomcat.service
sudo systemctl daemon-reload
sudo systemctl start tomcat
cd
wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war
sudo cp sample.war /opt/tomcat/latest/webapps
