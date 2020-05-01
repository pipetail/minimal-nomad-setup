job "prometheus" {
  datacenters = ["fra1"]
  type        = "service"

  group "monitoring" {
    count = 1

    restart {
      attempts = 2
      interval = "30m"
      delay    = "15s"
      mode     = "fail"
    }

    ephemeral_disk {
      size = 300
    }

    task "prometheus" {
      template {
        change_mode = "noop"
        destination = "local/prometheus.yml"

        data = <<EOH
---
global:
  scrape_interval:     5s
  evaluation_interval: 5s

scrape_configs:

  - job_name: 'traefik_metrics'
    consul_sd_configs:
    - server: '{{ env "NOMAD_IP_prometheus_ui" }}:8500'
      services: ['traefik-dashboard']
    scrape_interval: 60s
    metrics_path: /metrics
    params:
      format: ['prometheus']

  - job_name: 'nomad_metrics'
    consul_sd_configs:
    - server: '{{ env "NOMAD_IP_prometheus_ui" }}:8500'
      services: ['nomad-client', 'nomad']
    relabel_configs:
    - source_labels: ['__meta_consul_tags']
      regex: '(.*)http(.*)'
      action: keep
    scrape_interval: 60s
    metrics_path: /v1/metrics
    params:
      format: ['prometheus']
EOH
      }

      driver = "docker"

      config {
        image = "prom/prometheus:latest"

        volumes = [
          "local/prometheus.yml:/etc/prometheus/prometheus.yml",
        ]

        port_map {
          prometheus_ui = 9090
        }
      }

      resources {
        network {
          mbits = 10
          port  "prometheus_ui"{}
        }
      }

      service {
        name = "prometheus"
        tags = [
            "traefik.enable=true",
            "traefik.http.routers.prometheus.rule=Host(`prometheus.stepanvrany.cz`)",
            "traefik.http.routers.prometheus.entrypoints=websecure,web",
            "traefik.http.middlewares.prometheus-redirect-https.redirectscheme.scheme=https",
            "traefik.http.routers.prometheus.middlewares=prometheus-redirect-https"
        ]
        port = "prometheus_ui"

        check {
          name     = "prometheus_ui port alive"
          type     = "http"
          path     = "/-/healthy"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}