include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../nomad-client", "../vpc", "../nomad-server", "../consul", "../loadbalancer"]
}

dependency "nomad-client" {
  config_path = "../nomad-client"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "nomad-server" {
  config_path = "../nomad-server"
}

dependency "consul" {
  config_path = "../consul"
}

dependency "loadbalancer" {
  config_path = "../loadbalancer"
}

inputs = {
  frontend_tag_id = dependency.nomad-client.outputs.frontend_tag_id
  consul_tag_id = dependency.consul.outputs.consul_tag_id
  nomad_client_tag_id = dependency.nomad-client.outputs.nomad_client_tag_id
  nomad_server_tag_id = dependency.nomad-server.outputs.nomad_server_tag_id
  vpc_id = dependency.vpc.outputs.vpc_id
  lb_id = dependency.loadbalancer.outputs.lb_id
}

