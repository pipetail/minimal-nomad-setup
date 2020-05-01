resource "digitalocean_firewall" "nomad_client" {
  name = "nomad-client"

  tags = [
    var.nomad_client_tag_id,
  ]

  inbound_rule {
    protocol   = "tcp"
    port_range = "22"
    source_tags = [
      "js", # my personal tag in DigitalOcean :)
    ]
  }

  inbound_rule {
    protocol   = "tcp"
    port_range = "1-65535"
    source_tags = [
      var.consul_tag_id,
      var.nomad_client_tag_id,
      var.nomad_server_tag_id,
    ]
  }

  inbound_rule {
    protocol   = "udp"
    port_range = "1-65535"
    source_tags = [
      var.consul_tag_id,
      var.nomad_client_tag_id,
      var.nomad_server_tag_id,
    ]
  }

  inbound_rule {
    protocol = "icmp"
    source_tags = [
      var.consul_tag_id,
      var.nomad_client_tag_id,
      var.nomad_server_tag_id,
    ]
  }

  // traffic from DigitalOcean LB
  inbound_rule {
    protocol = "tcp"
    port_range = "8080-8082"
    source_load_balancer_uids = [
        var.lb_id,
    ]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}