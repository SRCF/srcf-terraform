# Terraform for SRCF infrastructure

These are Terraform modules and 'deployments' (i.e. compositions of modules and
environment-specific configuration to define a given subset of our
infrastructure) for the systems and services run by the SRCF.


## How to use

`terraform plan`, `terraform apply` etc. should be run from within a given
deployment folder.

The Terraform state (which stores Terraform's memory of all resources it
manages between invocations of the tool) is stored and locked via a Postgres
database, accessible to the sysadmins.  As a one-time action, when first
running `terraform init` the correct backend config argument must be passed to
set up this database as Terraform's state backend.


## Design notes

This is a work in progress.  Currently, the aim of this Terraform code is to set
up infrastructure to a minimal 'configurable' state, at which point our [Ansible
roles and playbooks][ansible] take over.  The Terraform code should not try to
set things up any more, except where there is a sensible universal requirement
(for example, installing the Xen guest agent on Xen VMs).

[ansible]: https://github.com/SRCF/srcf-ansible
