variable "project" {
  type = "string"
}

variable "region" {
  type    = "string"
  default = "europe-west1"
}

variable "database_version" {
  description = "The database version."
  default     = "MYSQL_5_7"
}

variable "zone" {
  type    = "string"
  default = "europe-west1-d"
}

variable "sql_user" {
  type    = "string"
  default = "root"
}

variable "sql_password" {
  type    = "string"
  default = "pwd"    //not sensible to provide a default but as this is for demo purposes we'll leave it in
}

variable "location" {
  type    = "string"
  default = "EU"
}

variable "storage_class" {
  type    = "string"
  default = "MULTI_REGIONAL"
}

variable "service_account_name" {
  type    = "string"
  default = "svcacnt"
}
