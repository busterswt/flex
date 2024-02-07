# Params file for variables

#### GLANCE
variable "image" {
  type    = string
  default = "Ubuntu-22.04"
}

#### NEUTRON
variable "external_network" {
  type    = string
  default = "PUBLICNET"
}

# UUID of external gateway
variable "external_gateway" {
  type    = string
  default = "921421a2-cd3c-4547-bff7-1fe62395df72"
}

variable "dns_ip" {
  type    = list(string)
  default = ["8.8.8.8", "8.8.4.4"]
}

#### VM HTTP parameters ####
variable "flavor_http" {
  type    = string
  default = "m1.small"
}

variable "network_http" {
  type = map(string)
  default = {
    subnet_name = "subnet-http"
    cidr        = "192.168.1.0/24"
  }
}
