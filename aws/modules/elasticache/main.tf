# --- ElastiCache Subnet Group ---
resource "aws_elasticache_subnet_group" "main" {
  name       = "${var.project}-${var.environment}-cache-subnet"
  subnet_ids = var.subnet_ids

  tags = merge(var.tags, { Name = "${var.project}-${var.environment}-cache-subnet" })
}

# --- ElastiCache Redis Cluster ---
resource "aws_elasticache_cluster" "main" {
  cluster_id           = "${var.project}-${var.environment}-cache"
  engine               = "redis"
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  port                 = 6379

  subnet_group_name  = aws_elasticache_subnet_group.main.name
  security_group_ids = var.security_group_ids

  tags = merge(var.tags, { Name = "${var.project}-${var.environment}-cache" })
}
