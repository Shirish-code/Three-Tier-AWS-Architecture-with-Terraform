output "db_endpoint" {
  value = aws_db_instance.this.endpoint
}

output "db_name" {
  value = aws_db_instance.this.db_name
}

output "db_host" {
  value = element(split(":", aws_db_instance.this.endpoint), 0)
}