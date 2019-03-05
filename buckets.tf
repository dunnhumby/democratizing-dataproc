resource "google_storage_bucket" "warehouse" {
  name     = "${var.project}-warehouse"
  location = "${var.location}"
  project  = "${var.project}"
}

resource "google_storage_bucket" "hive_metastore_state_data_artif_bucket" {
  name          = "${var.project}-artif"
  location      = "${var.location}"
  project       = "${var.project}"
  storage_class = "${var.storage_class}"
  force_destroy = "true"
}

resource "google_storage_bucket_object" "cloud_sql_proxy_script" {
  name = "dataproc/cloud-sql-proxy.sh"

  content = "${file("./scripts/cloud-sql-proxy.sh")}"
  bucket  = "${google_storage_bucket.hive_metastore_state_data_artif_bucket.name}"
}
