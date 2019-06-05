module "assetto_server" {
  source           = "../../modules/assetto_server"
  ssh_allowed_list = ["84.51.157.221/32"]
}
