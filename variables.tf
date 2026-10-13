variable "project_network" {
  description = "Name of your existing CSC project network (e.g. project_2020483). No default: it is specific to your project and should never be guessed."
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "Your public IP address in CIDR form (e.g. 203.0.113.45/32), allowed to reach the VM over SSH. No default: a wrong or wide-open value here is a real security risk, so you must set it deliberately every time."
  type        = string

  validation {
    # Catches the common mistake of forgetting the /32 (or any prefix) and
    # pasting a bare IP address, which some providers would silently treat
    # as 0.0.0.0/0 (open to the whole internet).
    condition     = can(cidrhost(var.ssh_allowed_cidr, 0))
    error_message = "ssh_allowed_cidr must be a valid CIDR block, e.g. 203.0.113.45/32 (did you forget the /32?)."
  }
}

variable "student_name" {
  description = "Your name, shown on the web page written by cloud-init. No default: this is personal to you and must always be supplied explicitly."
  type        = string
}

variable "page_message" {
  description = "A short message shown on the web page, filled in by cloud-init."
  type        = string
  default     = "Hello from my OpenTofu-managed cPouta VM!"
}

variable "name_prefix" {
  description = "Prefix used to name every resource this project creates (key pair, security group, port, VM)."
  type        = string
  default     = "week7"
}

variable "image_name" {
  description = "Name of the OS image to boot, as listed under Compute -> Images."
  type        = string
  default     = "Ubuntu-24.04"
}

variable "flavor_name" {
  description = "Name of the instance flavor (size), as listed under Compute -> Instances -> Launch Instance -> Flavor."
  type        = string
  default     = "standard.tiny"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key to upload as the key pair. Only the public key ever leaves your laptop."
  type        = string
  default     = "~/.ssh/week7_ed25519.pub"
}