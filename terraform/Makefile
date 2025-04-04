init:
	terraform init -migrate-state -backend-config=secret.backend.tfvars

apply:
	terraform apply -auto-approve

destroy:
	terraform destroy

format:
	terraform fmt

start:
	sh apply-environment.sh

login:
	terraform login
