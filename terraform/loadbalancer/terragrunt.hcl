include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../nomad-client", "../vpc"]
}

dependency "nomad-client" {
  config_path = "../nomad-client"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  frontend_tag_id = dependency.nomad-client.outputs.frontend_tag_id
  vpc_id = dependency.vpc.outputs.vpc_id
}

