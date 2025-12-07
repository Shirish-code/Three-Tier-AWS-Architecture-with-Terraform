variable "region" {
  type    = string
  default = "us-east-1"
}

variable "db_username" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "my_ip_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "key_name" {
  type = string
}