variable "security_group" {
  type = object({ name=string, description=string })
}

variable "security_rules" {
  type = list(object({
    description=string,
    ethertype=string
    direction=string,
    protocol=string,
    port_range_min=number,
    port_range_max=number,
    remote_ip_prefix=string
  }))
}