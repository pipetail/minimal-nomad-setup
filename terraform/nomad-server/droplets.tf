data "digitalocean_image" "nomad" {
  name = "packer-1588272752"
}

resource "digitalocean_tag" "nomad_server" {
  name = "nomad-server"
}

resource "digitalocean_droplet" "nomad_0" {
  image  = data.digitalocean_image.nomad.id
  name   = "nomad0"
  region = "fra1"
  size   = "s-1vcpu-1gb"

  user_data = data.template_cloudinit_config.nomad_0.rendered

  ssh_keys = [
    var.key_fingerprint_stepan_vrany,
  ]

  tags = [
    digitalocean_tag.nomad_server.id,
  ]

  vpc_uuid = var.vpc_id

  volume_ids = [
    digitalocean_volume.nomad_0.id,
  ]
}

resource "digitalocean_droplet" "nomad_1" {
  image  = data.digitalocean_image.nomad.id
  name   = "nomad1"
  region = "fra1"
  size   = "s-1vcpu-1gb"

  user_data = data.template_cloudinit_config.nomad_1.rendered

  ssh_keys = [
    var.key_fingerprint_stepan_vrany,
  ]

  tags = [
    digitalocean_tag.nomad_server.id,
  ]

  vpc_uuid = var.vpc_id

  volume_ids = [
    digitalocean_volume.nomad_1.id,
  ]
}

resource "digitalocean_droplet" "nomad_2" {
  image  = data.digitalocean_image.nomad.id
  name   = "nomad2"
  region = "fra1"
  size   = "s-1vcpu-1gb"

  user_data = data.template_cloudinit_config.nomad_2.rendered

  ssh_keys = [
    var.key_fingerprint_stepan_vrany,
  ]

  tags = [
    digitalocean_tag.nomad_server.id,
  ]

  vpc_uuid = var.vpc_id

  volume_ids = [
    digitalocean_volume.nomad_2.id,
  ]
}

