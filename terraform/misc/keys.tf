resource "digitalocean_ssh_key" "stepan_vrany" {
  name       = "tf_stepan_vrany"
  public_key = file("${path.module}/assets/stepan_vrany.pub")
}