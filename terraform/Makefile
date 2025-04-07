init:
	terraform init -migrate-state -backend-config=secret.backend.tfvars

destroy:
	terraform destroy

format:
	terraform fmt

start:
	terraform apply -auto-approve
	terraform output -json > output.json

login:
	terraform login
