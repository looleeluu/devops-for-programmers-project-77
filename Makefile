start:
	make -C terraform start
	make -C ansible start

prepare-terraform:
	make -C ansible prepare-terraform

login-terraform:
	make -C terraform login

apply-terraform:
	make -C terraform apply

prepare-ansible:
	make -C terraform create-config

destroy:
	make -C terraform destroy

deploy:
	make -C ansible deploy

create-vault:
	make -C ansible create-vault

edit-vault:
	make -C ansible edit-vault

install:
	make prepare-terraform
	make -C terraform init
	make -C ansible install
