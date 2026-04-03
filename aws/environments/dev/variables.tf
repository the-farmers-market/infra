variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

variable "ec2_public_key" {
  description = "SSH public key for the EC2 instance"
  type        = string
}
