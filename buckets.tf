resource "google_storage_bucket" "hive_metastore_state_data_artif_bucket" {
  name          = "${google_sql_database_instance.hive_metastore_instance.name}-artif"
  location      = "${var.location}"
  project       = "${var.project}"
  storage_class = "${var.storage_class}"
  force_destroy = "true"
}

data "template_file" "cloud-sql-proxy" {
  template = "${file("${path.module}/scripts/cloud-sql-proxy.sh.tmpl")}"

  vars {
    sql_user     = "${var.sql_user}"
    sql_password = "${var.sql_password}"
  }
}

resource "google_storage_bucket_object" "cloud_sql_proxy_script" {
  name = "dataproc/cloud-sql-proxy.sh"

  content = "${data.template_file.cloud-sql-proxy.rendered}"
  bucket  = "${google_storage_bucket.hive_metastore_state_data_artif_bucket.name}"
}
