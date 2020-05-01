resource "digitalocean_record" "nomad_traefik" {
  domain = "stepanvrany.cz"
  type   = "A"
  name   = "traefik"
  value  = digitalocean_loadbalancer.public.ip
}