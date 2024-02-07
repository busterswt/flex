#### INSTANCE HTTP ####

data "template_file" "user_data" {
  template = file("scripts/install_webserver.yaml")
}

# Create instance
#
resource "openstack_compute_instance_v2" "http" {
  count       = 3
  name        = "Demo Server ${count.index}"
  image_name  = var.image
  flavor_name = var.flavor_http
  key_pair    = openstack_compute_keypair_v2.user_key.name
  user_data   = data.template_file.user_data.rendered
  network {
    port = "${element(openstack_networking_port_v2.http.*.id, count.index)}"
  }
  security_groups = [
    openstack_networking_secgroup_v2.http.id
  ]
}

# Create network port
resource "openstack_networking_port_v2" "http" {
  count          = 3
  name           = "port-http-${count.index}"
  network_id     = openstack_networking_network_v2.generic.id
  admin_state_up = true
  security_group_ids = [
    openstack_networking_secgroup_v2.http.id,
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.http.id
  }
}

# Create floating IP for the load balancer VIP
resource "openstack_networking_floatingip_v2" "floatip" {
  count          = 3
  pool           = var.external_network
  port_id        = "${element(openstack_networking_port_v2.http.*.id, count.index)}"
}
