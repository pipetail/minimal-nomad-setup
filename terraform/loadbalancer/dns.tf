resource "digitalocean_record" "nomad_traefik" {
  domain = "stepanvrany.cz"
  type   = "A"
  name   = "traefik"
  value  = digitalocean_loadbalancer.public.ip
}

resource "digitalocean_record" "nomad_nginx" {
  domain = "stepanvrany.cz"
  type   = "A"
  name   = "nginx"
  value  = digitalocean_loadbalancer.public.ip
}