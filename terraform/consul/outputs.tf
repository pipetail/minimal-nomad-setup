output "consul_0_fs_id" {
  value = digitalocean_volume.consul_0.filesystem_label
}

output "consul_1_fs_id" {
  value = digitalocean_volume.consul_1.filesystem_label
}

output "consul_2_fs_id" {
  value = digitalocean_volume.consul_2.filesystem_label
}
