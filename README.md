This project demonstrates how to use Terraform to create multiple dataproc clusters that use the same, shared, hivemetastore. It is essentially a demonstration of how to use Terraform to achieve the same as what is being demonstrated at [Using Apache Hive on Cloud Dataproc](https://cloud.google.com/solutions/using-apache-hive-on-cloud-dataproc#creating_the_warehouse_bucket) using `gcloud`.

Ensure you have enabled the relevant APIs:
* [Google Dataproc API](https://console.developers.google.com/apis/library/dataproc.googleapis.com)
* [Google SQL Admin API](https://console.developers.google.com/apis/library/sqladmin.googleapis.com)

by issuing `gcloud services enable dataproc.googleapis.com sqladmin.googleapis.com`


