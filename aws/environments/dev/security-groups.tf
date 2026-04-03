module "security_groups" {
  source = "../../modules/security_groups"

  vpc_id = module.vpc.vpc_id

  project     = local.project
  environment = local.environment
  tags        = local.common_tags
}
