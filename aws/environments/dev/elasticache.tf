module "elasticache" {
  source = "../../modules/elasticache"

  node_type      = "cache.t3.micro"
  engine_version = "7.1"

  subnet_ids         = module.vpc.private_subnet_ids
  security_group_ids = [module.security_groups.cache_sg_id]

  project     = local.project
  environment = local.environment
  tags        = local.common_tags
}
