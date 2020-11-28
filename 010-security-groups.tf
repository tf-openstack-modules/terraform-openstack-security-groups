# Acces group, open input port 80 and ssh port
resource "openstack_networking_secgroup_v2" "secgroup" {
  name        = var.security_group.name
  description = var.security_group.description
}


resource "openstack_networking_secgroup_rule_v2" "secgroup_rule" {
  count = length(var.security_rules)
  direction         = var.security_rules[count.index].direction
  ethertype         = var.security_rules[count.index].ethertype
  protocol          = var.security_rules[count.index].protocol
  port_range_min    = var.security_rules[count.index].port_range_min
  port_range_max    = var.security_rules[count.index].port_range_max
  description = var.security_rules[count.index].description
  remote_ip_prefix = var.security_rules[count.index].remote_ip_prefix
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}