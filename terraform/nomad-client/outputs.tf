output "frontend_tag_id" {
  value = digitalocean_tag.frontend.id
}

output "nomad_client_tag_id" {
  value = digitalocean_tag.nomad_client.id
}

