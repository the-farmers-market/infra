output "app_sg_id" {
  description = "Security group ID for the application server"
  value       = aws_security_group.app.id
}

output "db_sg_id" {
  description = "Security group ID for the database"
  value       = aws_security_group.db.id
}

output "cache_sg_id" {
  description = "Security group ID for the cache"
  value       = aws_security_group.cache.id
}
