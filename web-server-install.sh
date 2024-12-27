#!/bin/bash
apt-get update
apt-get install -y nginx
echo "<html><body><h1>Congratulations!! You have successfully deployed an EC2 instance with NGINX on it.</h1></body></html>" > /var/www/html/index.html
systemctl start nginx
systemctl enable nginx