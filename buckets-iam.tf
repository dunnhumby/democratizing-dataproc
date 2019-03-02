resource "google_storage_bucket_iam_binding" "hive-artif-admin" {
  bucket  = "${google_storage_bucket.hive_metastore_state_data_artif_bucket.name}"
  role    = "roles/storage.objectAdmin"
  members = ["serviceAccount:${google_service_account.service_account.email}"]
}

resource "google_storage_bucket_iam_binding" "hive-artif-view" {
  bucket = "${google_storage_bucket.hive_metastore_state_data_artif_bucket.name}"
  role   = "roles/storage.objectViewer"

  members = [
    "serviceAccount:${google_service_account.service_account.email}",
  ]
}
