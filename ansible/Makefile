edit-vault:
	ansible-vault edit group_vars/webservers/vault.yml --vault-password-file ../vault.password

prepare-terraform:
	ansible-playbook terraform.yml --vault-pass-file ../vault.password

install:
	ansible-galaxy install -r requirements.yml

list:
	ansible-inventory -i inventory.ini --list --vault-password-file ../vault.password

ping:
	ansible -i inventory.ini all -m ping --vault-password-file ../vault.password

deploy:
	ansible-playbook -i inventory.ini playbook.yml --tags deploy --vault-password-file ../vault.password

prepare:
	ansible-playbook -i inventory.ini playbook.yml --tags prepare --vault-password-file ../vault.password

datadog:
	ansible-playbook -i inventory.ini playbook.yml --tags datadog --vault-password-file ../vault.password

start:
	ansible-playbook -i inventory.ini playbook.yml --vault-password-file ../vault.password
