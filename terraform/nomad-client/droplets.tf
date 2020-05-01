data "digitalocean_image" "nomad" {
  name = "packer-1588315549"
}

resource "digitalocean_tag" "frontend" {
  name = "frontend"
}

resource "digitalocean_droplet" "nomad_0" {
  image  = data.digitalocean_image.nomad.id
  name   = "nomadc0"
  region = "fra1"
  size   = "s-1vcpu-1gb"

  user_data = data.template_cloudinit_config.nomad_0.rendered

  ssh_keys = [
    var.key_fingerprint_stepan_vrany,
  ]

  tags = [digitalocean_tag.frontend.id]

  vpc_uuid = var.vpc_id
}

resource "digitalocean_droplet" "nomad_1" {
  image  = data.digitalocean_image.nomad.id
  name   = "nomadc1"
  region = "fra1"
  size   = "s-1vcpu-1gb"

  user_data = data.template_cloudinit_config.nomad_1.rendered

  ssh_keys = [
    var.key_fingerprint_stepan_vrany,
  ]

  tags = [digitalocean_tag.frontend.id]

  vpc_uuid = var.vpc_id
}

resource "digitalocean_droplet" "nomad_2" {
  image  = data.digitalocean_image.nomad.id
  name   = "nomadc2"
  region = "fra1"
  size   = "s-1vcpu-1gb"

  user_data = data.template_cloudinit_config.nomad_2.rendered

  ssh_keys = [
    var.key_fingerprint_stepan_vrany,
  ]

  tags = [digitalocean_tag.frontend.id]

  vpc_uuid = var.vpc_id
}

