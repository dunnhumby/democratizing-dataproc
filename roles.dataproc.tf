locals {
  dataproc_editor_members = [
    "serviceAccount:${google_service_account.service_account.email}",
  ]

  dataproc_worker_members = [
    "serviceAccount:${google_service_account.service_account.email}",
  ]
}

resource "google_project_iam_member" "iam_dataproc_editor" {
  project = "${var.project}"
  role    = "roles/dataproc.editor"
  member  = "${local.dataproc_editor_members[count.index]}"
  count   = "1"
}

resource "google_project_iam_member" "iam_dataproc_worker" {
  project = "${var.project}"
  role    = "roles/dataproc.worker"
  member  = "${local.dataproc_worker_members[count.index]}"
  count   = "1"
}
