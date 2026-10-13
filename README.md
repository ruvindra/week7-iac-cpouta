# Week 7 - cPouta VM as Code (OpenTofu)

Rebuilds the Week 1 web server using OpenTofu instead of manual clicks.

## Prerequisites
- OpenTofu installed (`tofu version`)
- A CSC Application Credential downloaded as `clouds.yaml` in this folder
- An SSH key pair at `~/.ssh/week7_ed25519` (`ssh-keygen -t ed25519 -f ~/.ssh/week7_ed25519`)

## Setup
1. Copy `terraform.tfvars.example` to `terraform.tfvars` and fill in your own values
   (your project network name, your public IP in CIDR form, your name).
2. `tofu init`
3. `tofu validate`
4. `tofu plan`
5. `tofu apply`

## Output
After apply, the `url` output gives the address of the deployed page.

## Destroy
`tofu destroy` removes everything this project created (VM, security group, port, floating IP, key pair). The project network itself is never touched - it existed before this project and isn't managed by it.