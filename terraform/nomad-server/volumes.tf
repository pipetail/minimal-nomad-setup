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