resource "digitalocean_volume" "nomad_0" {
  region                  = "fra1"
  name                    = "nomad0"
  size                    = 1
  initial_filesystem_type = "ext4"
}

resource "digitalocean_volume" "nomad_1" {
  region                  = "fra1"
  name                    = "nomad1"
  size                    = 1
  initial_filesystem_type = "ext4"
}

resource "digitalocean_volume" "nomad_2" {
  region                  = "fra1"
  name                    = "nomad2"
  size                    = 1
  initial_filesystem_type = "ext4"
}

resource "digitalocean_volume_attachment" "nomad_0" {
  droplet_id = digitalocean_droplet.nomad_0.id
  volume_id  = digitalocean_volume.nomad_0.id
}

resource "digitalocean_volume_attachment" "nomad_1" {
  droplet_id = digitalocean_droplet.nomad_1.id
  volume_id  = digitalocean_volume.nomad_1.id
}

resource "digitalocean_volume_attachment" "nomad_2" {
  droplet_id = digitalocean_droplet.nomad_2.id
  volume_id  = digitalocean_volume.nomad_2.id
}