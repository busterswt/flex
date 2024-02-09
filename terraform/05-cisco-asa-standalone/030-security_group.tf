# Access group, open input port 80 and ssh port
resource "openstack_networking_secgroup_v2" "http" {
  name        = "http"
  description = "Open input http port"
}

resource "openstack_networking_secgroup_rule_v2" "http_rule" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = "80"
  port_range_max = "80"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.http.id
}
