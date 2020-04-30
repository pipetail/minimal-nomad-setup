data "template_cloudinit_config" "consul_0" {
  gzip          = false
  base64_encode = false

  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content = templatefile(
      "${path.module}/assets/cloud-init.yaml",
      {
        fqdn       = "consul0.stepanvrany.cz"
        hostname   = "consul0"
        datacenter = "fra1"
        member_1   = "consul1.stepanvrany.cz"
        member_2   = "consul2.stepanvrany.cz"
        data_dir   = "/mnt/consul_0"
      }
    )
  }
}

data "template_cloudinit_config" "consul_1" {
  gzip          = false
  base64_encode = false

  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content = templatefile(
      "${path.module}/assets/cloud-init.yaml",
      {
        fqdn       = "consul1.stepanvrany.cz"
        hostname   = "consul1"
        datacenter = "fra1"
        member_1   = "consul0.stepanvrany.cz"
        member_2   = "consul2.stepanvrany.cz"
        data_dir   = "/mnt/consul_1"
      }
    )
  }
}

data "template_cloudinit_config" "consul_2" {
  gzip          = false
  base64_encode = false

  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content = templatefile(
      "${path.module}/assets/cloud-init.yaml",
      {
        fqdn       = "consul2.stepanvrany.cz"
        hostname   = "consul2"
        datacenter = "fra1"
        member_1   = "consul0.stepanvrany.cz"
        member_2   = "consul1.stepanvrany.cz"
        data_dir   = "/mnt/consul_2"
      }
    )
  }
}