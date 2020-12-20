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

# Inventory
Display inventory
```
ansible-inventory -i hcloud.yml --graph
```

To specify connection parameters there are two options:

1.
```
$ tree
.
├── ansible.cfg
└── inventory
    ├── hcloud.yml
    └── vars.yml
```
```
$ cat ansible.cfg
[defaults]
inventory      = $PWD/inventory
```
```
$ cat inventory/hcloud.yml
---
plugin: hcloud
token: [TOKEN]
```
```
$ cat inventory/vars.yml
---
all:
  vars:
    ansible_user: [USER]
    ansible_ssh_private_key_file: ~/.ssh/id_rsa
```

2.
```
$ tree
.
├── ansible.cfg
├── group_vars
│   └── all.yml
└── hcloud.yml
```
```
$ cat ansible.cfg
[defaults]
inventory      = $PWD/hcloud.yml
```
```
$ cat hcloud.yml
---
plugin: hcloud
token: [TOKEN]
```
```
$ cat group_vars/all.yml
---
ansible_user: [USER]
ansible_ssh_private_key_file: ~/.ssh/id_rsa
```

Display and check inventory
```
ansible-inventory --graph
ansible-inventory --list
ansible all -m ping
ansible-playbook ping.yml
```

# Useful links

https://community.hetzner.com/tutorials/howto-hcloud-ansible

http://mrtango.planetcrazy.de/ansible-add-an-empty-line-before-a-blockinfile.html

https://regex101.com/
