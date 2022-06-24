resource "google_dataproc_cluster" "cluster2" {
  name       = "${var.project}-cluster2"
  region     = "${var.region}"
  project    = "${var.project}"
  depends_on = ["google_sql_user.sql_user"]

  cluster_config {
    gce_cluster_config {
      zone       = "${var.zone}"
#       tags            = ["sql-egress", "${google_compute_network.network.name}-allow-internal"]
#       subnetwork = "${google_compute_subnetwork.subnet.name}"

      metadata = {
        hive-metastore-instance = "${google_sql_database_instance.hive_metastore_instance.connection_name}"
      }

      service_account_scopes = ["cloud-platform"]
    }

    software_config {
      image_version = "1.3"

      override_properties = {
        "hive:hive.metastore.warehouse.dir" = "gs://${google_storage_bucket.warehouse.name}/datasets"
      }
    }

    initialization_action {
      script      = "gs://${google_storage_bucket_object.cloud_sql_proxy_script.bucket}/${google_storage_bucket_object.cloud_sql_proxy_script.name}"
      timeout_sec = 500
    }
  }
}

# Submit an example spark job to a dataproc cluster, just to prove that we can
resource "google_dataproc_job" "cluster2_sparkpi" {
  region       = "${google_dataproc_cluster.cluster1.region}"
  force_delete = true
  depends_on   = ["google_dataproc_cluster.cluster2"]

  placement {
    cluster_name = "${google_dataproc_cluster.cluster2.name}"
  }

  spark_config {
    main_class    = "org.apache.spark.examples.SparkPi"
    jar_file_uris = ["file:///usr/lib/spark/examples/jars/spark-examples.jar"]
    args          = ["1000"]

    properties = {
      "spark.logConf" = "true"
    }

    logging_config {
      driver_log_levels = {
        "root" = "INFO"
      }
    }
  }
}

# Submit an example pyspark job to a dataproc cluster, just to prove that we can
resource "google_dataproc_job" "cluster2_pyspark" {
  region       = "${google_dataproc_cluster.cluster1.region}"
  force_delete = true
  depends_on   = ["google_dataproc_cluster.cluster2"]

  placement {
    cluster_name = "${google_dataproc_cluster.cluster2.name}"
  }

  pyspark_config {
    main_python_file_uri = "gs://dataproc-examples-2f10d78d114f6aaec76462e3c310f31f/src/pyspark/hello-world/hello-world.py"

    properties = {
      "spark.logConf" = "true"
    }
  }
}
