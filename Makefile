init:
	terraform init \
	    -var project=democratising-dataproc \
	    -reconfigure \
	    -get=true \
	    -get-plugins=true \
	    -upgrade=true \
	    -verify-plugins=true \
	    -backend-config=bucket="democratising-dataproc-tf-state" \
	    -backend-config=prefix=democratising-dataproc

apply:
	terraform apply \
	    -var project=democratising-dataproc \
	    -auto-approve
destroy:
	terraform destroy \
	    -var project=democratising-dataproc \
	    -auto-approve