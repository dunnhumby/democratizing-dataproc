.PHONY: init check-gcp-project-guard

init: check-gcp-project-guard
	terraform init \
	    -var project=${GCP_PROJECT} \
	    -reconfigure \
	    -get=true \
	    -get-plugins=true \
	    -upgrade=true \
	    -verify-plugins=true \
	    -backend-config=bucket="${GCP_PROJECT}-tf-state" \
	    -backend-config=prefix=${GCP_PROJECT}

apply: check-gcp-project-guard
	terraform apply \
	    -var project=${GCP_PROJECT} \
	    -auto-approve

destroy: check-gcp-project-guard
	terraform destroy \
	    -var project=${GCP_PROJECT} \
	    -auto-approve

check-gcp-project-guard:
ifndef GCP_PROJECT
	$(error GCP_PROJECT is undefined)
endif