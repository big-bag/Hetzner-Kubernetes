# Setting up environment

Create a virtual environment
```
python3 -m virtualenv venv
```

Activate the virtual environment
```
source venv/bin/activate.fish
```

Install Ansible
```
python3 -m pip install ansible==2.9.18
```

Install collections
```
ansible-galaxy collection install -r requirements.yml -p ./collections
```

Install requirements and library for [Hetzner Cloud dynamic inventory](https://docs.ansible.com/ansible/latest/collections/hetzner/hcloud/hcloud_inventory.html "Ansible dynamic inventory plugin for the Hetzner Cloud")
```
pip3 install jmespath \
             hcloud \
             openshift \
             kubernetes-validate
```

Deactivate the virtual environment
```
deactivate
```

# Populate content of secret file
`host_vars/localhost/vault.yml`
```
---
vault_hcloud_token: [ token with read/write permissions generated in hetzner project: security -> api tokens ]

vault_name: [ username ]
vault_comment: [ full name ]
vault_password: [ password ]

vault_ssh_port: [ port which different from standard '22' ]

vault_one_password_device_id: [ device id which displayed in ansible error output when login first time to 1password from play host or in ~/.op/config ]
# or generate new device id each time
# vault_one_password_device_id: "{{ lookup('password', '/dev/null chars=ascii_lowercase,digits length=26') }}"
vault_one_password_master_password: '[ password from 1password account ]'
vault_one_password_subdomain: [ subdomain of 1password website ]
vault_one_password_email_address: [ email from 1password account ]
vault_one_password_secret_key: [ secret key from 1password account ]
vault_one_password_vault_name: [ vault name which will be created and where it will be stored secrets of servers from project ]

vault_github_username: [ github account username ]
vault_github_password: [ github account password or personal access token: https://github.com/settings/tokens ]
```

# Launching installation

Activate the virtual environment
```
source venv/bin/activate.fish
```

Run playbook to install kubernetes cluster
```
ansible-playbook site.yml
```

Run playbook to delete all resources
```
ansible-playbook site.yml --tags "destroy"
```

Deactivate the virtual environment
```
deactivate
```
