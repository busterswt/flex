#### INSTANCE HTTP ####

data "template_file" "user_data" {
  template = file("scripts/day0.txt")
}

# Create instance
#
resource "openstack_compute_instance_v2" "asav5" {
  name        = "Cisco ASAv5"
  image_name  = var.image
  flavor_name = var.flavor_asav5
  user_data   = data.template_file.user_data.rendered
  config_drive = true
  network {
    port = openstack_networking_port_v2.management.id
  }
}

# Create network port
resource "openstack_networking_port_v2" "management" {
  name           = "port-management-asav5"
  network_id     = openstack_networking_network_v2.management.id
  admin_state_up = true
  security_group_ids = [
    openstack_networking_secgroup_v2.ssh.id,
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.management.id
  }
}

resource "openstack_networking_port_v2" "inside" {
  name           = "port-inside-asav5"
  network_id     = openstack_networking_network_v2.inside.id
  admin_state_up = true
  security_group_ids = [
    openstack_networking_secgroup_v2.ssh.id,
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.inside.id
  }
}
