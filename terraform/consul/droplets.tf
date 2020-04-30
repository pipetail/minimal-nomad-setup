data "digitalocean_image" "consul" {
  name = "packer-1588257475"
}

resource "digitalocean_droplet" "consul_0" {
  image  = data.digitalocean_image.consul.id
  name   = "consul0"
  region = "fra1"
  size   = "s-1vcpu-1gb"

  user_data = data.template_cloudinit_config.consul_0.rendered

  ssh_keys = [
    var.key_fingerprint_stepan_vrany,
  ]

  vpc_uuid = var.vpc_id
}

resource "digitalocean_droplet" "consul_1" {
  image  = data.digitalocean_image.consul.id
  name   = "consul1"
  region = "fra1"
  size   = "s-1vcpu-1gb"

  user_data = data.template_cloudinit_config.consul_1.rendered

  ssh_keys = [
    var.key_fingerprint_stepan_vrany,
  ]

  vpc_uuid = var.vpc_id
}

resource "digitalocean_droplet" "consul_2" {
  image  = data.digitalocean_image.consul.id
  name   = "consul2"
  region = "fra1"
  size   = "s-1vcpu-1gb"

  user_data = data.template_cloudinit_config.consul_2.rendered

  ssh_keys = [
    var.key_fingerprint_stepan_vrany,
  ]

  vpc_uuid = var.vpc_id
}
