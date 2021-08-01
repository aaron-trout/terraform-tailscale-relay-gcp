variable "vpc_subnet_cidr" {
  description = "CIDR to use for the GCP subnet. Default: 10.224.0.0/26"
  type = string
  default = "10.224.0.0/24"
}

variable "instance_type" {
  description = "GCP instance type to use. Default: f1-micro"
  type = string
  default = "f1-micro"
}

variable "tailscale_auth_key" {
  description = "Tailscale authentication key for the node (required)"
  type = string
}

variable "hostname" {
  description = "Hostname to use when connecting to tailscale. Default: tailscale-relay"
  type = string
  default = "tailscale-relay"
}
