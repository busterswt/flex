# Access group, open input port 80 and ssh port
resource "openstack_networking_secgroup_v2" "ssh" {
  name        = "ssh"
  description = "Open input ssh port"
}

resource "openstack_networking_secgroup_rule_v2" "ssh_rule" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = "22"
  port_range_max = "22"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.ssh.id
}
