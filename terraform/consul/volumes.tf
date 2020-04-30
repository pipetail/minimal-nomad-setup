resource "digitalocean_volume" "consul_0" {
  region                  = "fra1"
  name                    = "consul0"
  size                    = 1
  initial_filesystem_type = "ext4"
}

resource "digitalocean_volume" "consul_1" {
  region                  = "fra1"
  name                    = "consul1"
  size                    = 1
  initial_filesystem_type = "ext4"
}

resource "digitalocean_volume" "consul_2" {
  region                  = "fra1"
  name                    = "consul2"
  size                    = 1
  initial_filesystem_type = "ext4"
}

resource "digitalocean_volume_attachment" "consul_0" {
  droplet_id = digitalocean_droplet.consul_0.id
  volume_id  = digitalocean_volume.consul_0.id
}

resource "digitalocean_volume_attachment" "consul_1" {
  droplet_id = digitalocean_droplet.consul_1.id
  volume_id  = digitalocean_volume.consul_1.id
}

resource "digitalocean_volume_attachment" "consul_2" {
  droplet_id = digitalocean_droplet.consul_2.id
  volume_id  = digitalocean_volume.consul_2.id
}