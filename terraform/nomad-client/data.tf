data "template_cloudinit_config" "nomad_0" {
  gzip          = false
  base64_encode = false

  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content = templatefile(
      "${path.module}/assets/cloud-init.yaml",
      {
        fqdn       = "nomadc0.stepanvrany.cz"
        hostname   = "nomadc0"
        datacenter = "fra1"
        consul_0   = "consul01.stepanvrany.cz"
        consul_1   = "consul1.stepanvrany.cz"
        consul_2   = "consul2.stepanvrany.cz"
        data_dir   = "/mnt/consul_0"
      }
    )
  }
}

data "template_cloudinit_config" "nomad_1" {
  gzip          = false
  base64_encode = false

  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content = templatefile(
      "${path.module}/assets/cloud-init.yaml",
      {
        fqdn       = "nomadc1.stepanvrany.cz"
        hostname   = "nomadc1"
        datacenter = "fra1"
        consul_0   = "consul01.stepanvrany.cz"
        consul_1   = "consul1.stepanvrany.cz"
        consul_2   = "consul2.stepanvrany.cz"
        data_dir   = "/mnt/consul_0"
      }
    )
  }
}

data "template_cloudinit_config" "nomad_2" {
  gzip          = false
  base64_encode = false

  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content = templatefile(
      "${path.module}/assets/cloud-init.yaml",
      {
        fqdn       = "nomadc2.stepanvrany.cz"
        hostname   = "nomadc2"
        datacenter = "fra1"
        consul_0   = "consul01.stepanvrany.cz"
        consul_1   = "consul1.stepanvrany.cz"
        consul_2   = "consul2.stepanvrany.cz"
        data_dir   = "/mnt/consul_0"
      }
    )
  }
}