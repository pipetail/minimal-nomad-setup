job "demo-webapp" {
  datacenters = ["fra1"]
  type = "service"

  group "demo" {
    count = 1

    task "server" {
      driver = "docker"

      config {
        image = "nginx"
        port_map {
            http = 80
        }
      }

      resources {
        network {
          port  "http"{        
          }
        }
      }

      service {
        name = "nginx"
        port = "http"

        tags = [
            "traefik.enable=true",
            "traefik.http.routers.nginx.rule=Host(`nginx.stepanvrany.cz`)",
            "traefik.http.routers.nginx.entrypoints=websecure",
        ]

        check {
          type     = "http"
          path     = "/"
          interval = "2s"
          timeout  = "2s"
        }
      }
    }
  }
}