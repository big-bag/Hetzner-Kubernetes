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

Example
```
---
vault_hcloud_token: u796XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXnTUK # HCloud Project -> Security -> API TOKENS; Permissions: Read/Write

vault_domain: example.com

vault_name:     some.user
vault_comment:  Some User
vault_password: P@s$ w0rD

vault_ssh_port: 9022                                                                 # Port that is different from the standard TCP/22

vault_one_password_device_id:       kjbpXXXXXXXXXXXXXXXXXXarjp                       # Can be found in ~/.op/config
vault_one_password_master_password: 'S0me P@ssword'
vault_one_password_subdomain:       example
vault_one_password_email_address:   some.user@example.com
vault_one_password_secret_key:      K9-XXXXXX-XXXXXX-XXXXX-XXXXX-XXXXX-U1J7R
vault_one_password_vault_name:      SomeVault                                        # Vault that will be created (if doesn't exist) and in which the secrets will be stored

vault_github_username: some-user
vault_github_password: 715bXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX52qd                      # Personal access token: https://github.com/settings/tokens

vault_cloudflare_api_token: 1syxXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX4Kka                 # https://dash.cloudflare.com/profile/api-tokens -> API Tokens; Permissions: Zone:Read, DNS:Edit
vault_letsencrypt_email:    some.user@example.com                                    # Email which Let's Encrypt will use to contact about expiring certificates
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
