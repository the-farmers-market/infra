module "ec2" {
  source = "../../modules/ec2"

  instance_type      = "t2.micro"
  subnet_id          = module.vpc.public_subnet_ids[0]
  security_group_ids = [module.security_groups.app_sg_id]
  public_key         = var.ec2_public_key

  instance_profile_name = aws_iam_instance_profile.ec2_app.name
  ecr_registry          = local.ecr_registry
  aws_region            = local.aws_region

  project     = local.project
  environment = local.environment
  tags        = local.common_tags
}
