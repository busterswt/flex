#### NETWORK CONFIGURATION ####

# Router creation
resource "openstack_networking_router_v2" "router" {
  name                = "router"
  external_network_id = var.external_gateway
}

# Network creation
resource "openstack_networking_network_v2" "inside" {
  name = "network-inside"
}

# Network creation
resource "openstack_networking_network_v2" "management" {
  name = "network-management"
}

#### HTTP SUBNET ####

# Subnet http configuration
resource "openstack_networking_subnet_v2" "inside" {
  name            = var.network_inside["subnet_name"]
  network_id      = openstack_networking_network_v2.inside.id
  cidr            = var.network_inside["cidr"]
  dns_nameservers = var.dns_ip
}

resource "openstack_networking_subnet_v2" "management" {
  name            = var.network_management["subnet_name"]
  network_id      = openstack_networking_network_v2.management.id
  cidr            = var.network_management["cidr"]
  dns_nameservers = var.dns_ip
}

# Router interface configuration
resource "openstack_networking_router_interface_v2" "inside" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.inside.id
}

resource "openstack_networking_router_interface_v2" "management" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.management.id
}
