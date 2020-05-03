# Minimal Nomad setup for PoCs

## Important sources
- https://learn.hashicorp.com/consul/datacenter-deploy/deployment-guide
- https://www.consul.io/docs/agent/options.html
- https://www.nomadproject.io/docs/configuration/index.html
- https://www.nomadproject.io/docs/install/production/deployment-guide/
- https://www.nomadproject.io/docs/configuration/client/
- https://www.nomadproject.io/docs/schedulers/#system
- https://www.nomadproject.io/docs/job-specification/network/
- https://codefresh.io/docs/docs/yaml-examples/examples/nomad/
- https://docs.traefik.io/providers/consul-catalog
- https://docs.traefik.io/routing/providers/consul-catalog/
- https://learn.hashicorp.com/nomad/operating-nomad/prometheus-metrics
- https://github.com/hashicorp/nomad/issues/209
- https://learn.hashicorp.com/consul/security-networking/forwarding

## Before you use this template

We strongly believe that infrastructure code should be obvious and majority of
information should be hard-coded. Hence this example contains even domain names
and firewall rules with hard-coded parameters. If you want to use this code
for your own PoC, please replace following stuff with information specific
for your environment:

- `terraform/consul/droplets.tf`: reference to packer image
- `terraform/nomad-server/droplets.tf`: reference to packer image
- `terraform/nomad-client/droplets.tf`: reference to packer image
- `terraform/consul/dns.tf`: DNS records for droplets
- `terraform/nomad-server/dns.tf`: DNS records for droplets
- `terraform/nomad-client/dns.tf`: DNS records for droplets
- `terraform/consul/data.tf`: DNS records for droplets
- `terraform/nomad-server/data.tf`: DNS records for droplets
- `terraform/nomad-client/data.tf`: DNS records for droplets
- `terraform/firewall/*`: adjust firewall according to your needs
- `terraform/loadbalancer/dns.tf`: DNS records for Nomad services
- `terraform/loadbalancer/certificate.tf`: Let's Encrypt certificate for Nomad services