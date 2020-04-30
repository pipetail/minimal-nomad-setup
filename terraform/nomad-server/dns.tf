resource "digitalocean_record" "nomad_0" {
  domain = "stepanvrany.cz"
  type   = "A"
  name   = "nomad0"
  value  = digitalocean_droplet.nomad_0.ipv4_address_private
}

resource "digitalocean_record" "nomad_1" {
  domain = "stepanvrany.cz"
  type   = "A"
  name   = "nomad1"
  value  = digitalocean_droplet.nomad_1.ipv4_address_private
}

resource "digitalocean_record" "nomad_2" {
  domain = "stepanvrany.cz"
  type   = "A"
  name   = "nomad2"
  value  = digitalocean_droplet.nomad_2.ipv4_address_private
}