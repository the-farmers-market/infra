variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs to attach"
  type        = list(string)
}

variable "public_key" {
  description = "SSH public key for the key pair"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile name for ECR access"
  type        = string
}

variable "ecr_registry" {
  description = "ECR registry URL (account_id.dkr.ecr.region.amazonaws.com)"
  type        = string
}

variable "aws_region" {
  description = "AWS region for ECR login"
  type        = string
}

variable "project" {
  description = "Project name for tagging"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
