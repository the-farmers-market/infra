terraform {
  backend "s3" {
    bucket         = "fm-terraform-state-dev"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "fm-terraform-state-lock"
    encrypt        = true
    profile        = "personal"
  }
}
