resource "random_integer" "hive_metastore_number" {
  min = 10000
  max = 99999
}

resource "google_sql_database_instance" "hive_metastore_instance" {
  region           = "${var.region}"
  name             = "${var.project}-hive-metastore-${random_integer.hive_metastore_number.result}"
  database_version = "${var.database_version}"

  settings {
    tier              = "db-n1-standard-1"
    activation_policy = "ALWAYS"

    location_preference {
      zone = "${var.zone}"
    }
  }
}

//Create a user because terraform deletes the default root user that comes with the mysql instance
resource "google_sql_user" "sql_user" {
  name     = "root"
  instance = "${google_sql_database_instance.hive_metastore_instance.name}"
  project  = "${var.project}"
  password = "changeme"
  host     = "%"

  lifecycle {
    ignore_changes = [
      "password",
    ]
  }
}
