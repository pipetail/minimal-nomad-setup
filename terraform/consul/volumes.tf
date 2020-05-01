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