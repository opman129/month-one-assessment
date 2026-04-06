#!/bin/bash

yum update -y
yum install -y httpd

systemctl start httpd
systemctl enable httpd

INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)

cat <<EOF > /var/www/html/index.html
<html>
  <head><title>TechCorp Web Server</title></head>
  <body>
    <h1>Welcome to TechCorp</h1>
    <p>Instance ID: $INSTANCE_ID</p>
  </body>
</html>
EOF