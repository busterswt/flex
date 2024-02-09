#### Flavors ####

resource "openstack_compute_flavor_v2" "cisco-asav5" {
  name  = "cisco_asav5"
  ram   = "1024"
  vcpus = "1"
  disk  = "10"
  is_public = true
}
