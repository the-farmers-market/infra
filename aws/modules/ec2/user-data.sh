#!/bin/bash
set -euo pipefail

# Install Docker
dnf install -y docker
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user

# Install Docker Compose plugin
mkdir -p /usr/local/lib/docker/cli-plugins
curl -SL "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64" \
  -o /usr/local/lib/docker/cli-plugins/docker-compose
chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# Create 1GB swap (t2.micro has only 1GB RAM)
dd if=/dev/zero of=/swapfile bs=128M count=8
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile swap swap defaults 0 0' >> /etc/fstab

# Install AWS CLI (for ECR login)
dnf install -y aws-cli

# Create app directory
mkdir -p /home/ec2-user/app
chown ec2-user:ec2-user /home/ec2-user/app

# Configure ECR credential helper
cat > /home/ec2-user/ecr-login.sh << 'SCRIPT'
#!/bin/bash
aws ecr get-login-password --region ${aws_region} | docker login --username AWS --password-stdin ${ecr_registry}
SCRIPT
chmod +x /home/ec2-user/ecr-login.sh
chown ec2-user:ec2-user /home/ec2-user/ecr-login.sh
