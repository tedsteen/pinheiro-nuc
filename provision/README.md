# NUC provisioning

How to provision the marati NUC

## Create a machine to run the node on

```bash
# Build preseeded debian ISO by running the script in `nuc`
cd nuc
./create_preseed_iso.sh

# Burn that to USB stick and start install
```

## The provisioning

Install and setup the newly installed machine.

### Dependencies (ansible and plugins)

Before you start provisioning you need to install ansible and some requirements on your local machine.

```bash
pip install ansible
ansible-galaxy collection install community.general devsec.hardening
ansible-galaxy install -r requirements.yml --force
```

### Base provisioning

```bash
# Do base provisioning
ansible-playbook base.yaml -i nuc.pinheiro.s3n.io, --user ted
```