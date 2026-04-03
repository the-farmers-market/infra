module "rds" {
  source = "../../modules/rds"

  instance_class = "db.t3.micro"
  engine_version = "16"

  db_name     = "farmers_market"
  db_username = "postgres"
  db_password = var.db_password

  subnet_ids         = module.vpc.private_subnet_ids
  security_group_ids = [module.security_groups.db_sg_id]

  project     = local.project
  environment = local.environment
  tags        = local.common_tags
}
