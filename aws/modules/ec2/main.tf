# --- Key Pair ---
resource "aws_key_pair" "app" {
  key_name   = "${var.project}-${var.environment}-app-key"
  public_key = var.public_key

  tags = merge(var.tags, { Name = "${var.project}-${var.environment}-app-key" })
}

# --- Elastic IP ---
resource "aws_eip" "app" {
  domain = "vpc"

  tags = merge(var.tags, { Name = "${var.project}-${var.environment}-app-eip" })
}

resource "aws_eip_association" "app" {
  instance_id   = aws_instance.app.id
  allocation_id = aws_eip.app.id
}

# --- EC2 Instance ---
resource "aws_instance" "app" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = aws_key_pair.app.key_name
  iam_instance_profile   = var.instance_profile_name

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
    encrypted   = true
  }

  user_data = base64encode(templatefile("${path.module}/user-data.sh", {
    ecr_registry = var.ecr_registry
    aws_region   = var.aws_region
  }))

  tags = merge(var.tags, { Name = "${var.project}-${var.environment}-app" })
}

# --- Latest Amazon Linux 2023 AMI ---
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
