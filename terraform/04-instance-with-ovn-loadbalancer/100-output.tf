output "float_ip" {
  value       = openstack_networking_floatingip_v2.floatip_http_vip.*.address
}
