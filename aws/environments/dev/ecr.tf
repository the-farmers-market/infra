module "ecr" {
  source = "../../modules/ecr"

  repository_name = "the-farmers-market/api"
  image_count     = 3

  tags = local.common_tags
}
