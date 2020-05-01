include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../misc", "../vpc"]
}

dependency "misc" {
  config_path = "../misc"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  key_fingerprint_stepan_vrany = dependency.misc.outputs.fingerprint_stepan_vrany
  vpc_id = dependency.vpc.outputs.vpc_id
}

