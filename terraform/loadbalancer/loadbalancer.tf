resource "digitalocean_loadbalancer" "public" {
    name   = "nomad-fe01"
    region = "fra1"
    forwarding_rule {
        entry_port     = 80
        entry_protocol = "http"
        target_port     = 8081
        target_protocol = "http"
    }

    healthcheck {
        port     = 8080
        protocol = "http"
        path = "/ping"
    }

    droplet_tag = var.frontend_tag_id
    vpc_uuid = var.vpc_id
}