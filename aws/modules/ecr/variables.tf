variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "image_count" {
  description = "Number of images to retain"
  type        = number
  default     = 3
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
