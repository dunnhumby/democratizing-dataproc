variable "project" {
  type = string
}

variable "region" {
  type    = string
  default = "europe-west1"
  
}

variable "database_version" {
  description = "The database version."
  default     = "MYSQL_5_7"
}

variable "zone" {
  type    = string
  default = "europe-west1-d"
}

variable "location" {
  type    = string
  default = "EU"
}

variable "storage_class" {
  type    = string
  default = "MULTI_REGIONAL"
}

variable "apis_to_activate" {
  description = "apis that will be enabled"
  type        = list(string)
  default     = ["dataproc.googleapis.com",
  "sqladmin.googleapis.com"]
}
