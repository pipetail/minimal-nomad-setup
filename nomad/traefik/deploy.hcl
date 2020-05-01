job "traefik" {
  datacenters = ["fra1"]
  type        = "system"
  priority = 100

  group "traefik" {

    update {
        max_parallel     = 1
        stagger = "2m"
        health_check = "task_states"
    }

    task "traefik" {
      driver = "docker"

      config {
        image        = "traefik:v2.2.1"
        network_mode = "host"

        args = [
            "--api=true",
            "--accesslog",
            "--log.format=json",
            "--metrics.prometheus=true",
            "--metrics.prometheus.addServicesLabels=true",
            "--api.dashboard=true",
            "--api.insecure=true",
            "--serverstransport.insecureskipverify=true",
            "--entrypoints.web.Address=:8081",
            "--entrypoints.web.forwardedheaders.insecure=true",
            "--entrypoints.web.http.redirections.entrypoint.scheme=https",
            "--entrypoints.web.http.redirections.entrypoint.to=websecure",
            "--entrypoints.websecure.Address=:8082",
            "--entrypoints.websecure.http.tls=true",
            "--entrypoints.websecure.forwardedheaders.insecure=true",
            "--ping",
            "--providers.consulcatalog=true",
            "--providers.consulcatalog.prefix=traefik",
            "--providers.consulcatalog.endpoint.address=http://127.0.0.1:8500",
            "--providers.consulcatalog.exposedByDefault=false"
        ]

        port_map {
            api = 8080
            http = 8081
            https = 8082
        }
      }

      resources {
        cpu    = 100
        memory = 128

        network {
          port "http" {
            static = 8081
          }

          port "https" {
              static = 8082
          }

          port "api" {
              static = 8080
          }
        }
      }

      service {
        name = "traefik-http"
        port = "http"
        check {
          name     = "alive-http"
          type     = "tcp"
          port     = "http"
          interval = "10s"
          timeout  = "2s"
        }
      }

      service {
        name = "traefik-dashboard"

        # https://docs.traefik.io/routing/providers/consul-catalog/
        tags = [
            "traefik.enable=true",
            "traefik.http.routers.dashboard.rule=Host(`traefik.stepanvrany.cz`)",
            "traefik.http.routers.dashboard.entrypoints=websecure",
        ]

        port = "api"

        check {
            name = "alive-dashboard"
            type = "http"
            port = "api"
            path = "/ping"
            interval = "5s"
            timeout  = "2s"
        }
      }
    }
  }
}