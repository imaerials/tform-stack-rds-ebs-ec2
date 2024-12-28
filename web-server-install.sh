#!/bin/bash

# Update system packages
apt-get update
apt-get upgrade -y

# Create a new user for Ghost
adduser ghostuser --disabled-password --gecos ""
usermod -aG sudo ghostuser

# Install Nginx
apt-get install -y nginx
ufw allow 'Nginx Full'

# Install MySQL
apt-get install -y mysql-server

# Install Node.js
apt-get install -y ca-certificates curl gnupg
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt-get update
apt-get install -y nodejs

# Install Ghost CLI
npm install -g ghost-cli@latest

# Install EFS-UTILS
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"
apt-get update
apt-get install -y git binutils rustc cargo pkg-config libssl-dev
git clone https://github.com/aws/efs-utils
cd efs-utils
./build-deb.sh
apt-get install -y ./build/amazon-efs-utils*deb

# Mount EFS
mkdir -p /var/www/${sitename}
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${efs_dns_name}:/ /var/www/sitename
chown ghostuser: /var/www/${sitename}
chmod 775 /var/www/${sitename}

# Navigate into the mounted directory
cd /var/www/${sitename}

# Create a simple HTML file to verify Nginx installation
echo "<html><body><h1>Congratulations!! You have successfully deployed an EC2 instance with NGINX on it.</h1></body></html>" > /var/www/${sitename}/index.html

# Start and enable Nginx
systemctl start nginx
systemctl enable nginx