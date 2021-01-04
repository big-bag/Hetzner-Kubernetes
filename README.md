# Requirements
Install collections with CLI
```
ansible-galaxy collection install -r requirements.yml
```

Install requirements for [dynamic inventory](https://docs.ansible.com/ansible/latest/collections/hetzner/hcloud/hcloud_inventory.html "Ansible dynamic inventory plugin for the Hetzner Cloud")
```
sudo apt install -y python3-pip
pip3 --version
```
```
pip3 install --upgrade pip
pip3 install hcloud
```

# Content of secret files
`hcloud.yml`
```
---
plugin: hcloud
token: [ token with read/write permissions generated in hetzner project: security -> api tokens ]
```

`group_vars/all/vault.yml`
```
---
vault_hcloud_token: [ token with read/write permissions generated in hetzner project: security -> api tokens ]

vault_name: [ username ]
vault_comment: [ full name ]
vault_password: [ password ]

vault_ssh_port: [ port which different from standard '22' ]

vault_one_password_device_id: [ device id which displayed in ansible error output when login first time to 1password from play host ]
vault_one_password_password: '[ password from 1password account ]'
vault_one_password_sign_in_address: [ url of 1password website ]
vault_one_password_email_address: [ email from 1password account ]
vault_one_password_secret_key: [ secret key from 1password account ]
vault_one_password_vault_name: [ vault name which will be created and where it will be stored secrets of servers from project ]
```
