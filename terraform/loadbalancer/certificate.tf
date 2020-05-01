resource "digitalocean_certificate" "public" {
  name = "nomad-fe01"
  type = "lets_encrypt"
  domains = [
    "traefik.stepanvrany.cz",
    "nginx.stepanvrany.cz",
    "prometheus.stepanvrany.cz",
  ]
}