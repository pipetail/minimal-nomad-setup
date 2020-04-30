resource "digitalocean_record" "consul_0" {
  domain = "stepanvrany.cz"
  type   = "A"
  name   = "consul0"
  value  = digitalocean_droplet.consul_0.ipv4_address_private
}

resource "digitalocean_record" "consul_1" {
  domain = "stepanvrany.cz"
  type   = "A"
  name   = "consul1"
  value  = digitalocean_droplet.consul_1.ipv4_address_private
}

resource "digitalocean_record" "consul_2" {
  domain = "stepanvrany.cz"
  type   = "A"
  name   = "consul2"
  value  = digitalocean_droplet.consul_2.ipv4_address_private
}