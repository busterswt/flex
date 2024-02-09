# Params file for variables

#### GLANCE
variable "image" {
  type    = string
  default = "Cisco ASAv 9.20(2)2"
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
variable "flavor_asav5" {
  type    = string
  default = "cisco_asav5"
}

variable "network_inside" {
  type = map(string)
  default = {
    subnet_name = "subnet-inside"
    cidr        = "192.168.1.0/24"
  }
}

variable "network_management" {
  type = map(string)
  default = {
    subnet_name = "subnet-management"
    cidr        = "172.16.1.0/24"
  }
}

variable "http_instance_names" {
  type = set(string)
  default = ["http-instance-1"]
}
