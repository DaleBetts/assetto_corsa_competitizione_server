variable "project_name" {
  type    = "string"
  default = "assetto"
}

variable "server_instance_type" {
  type    = "string"
  default = "t2.micro"
}

variable "ssh_allowed_list" {
  type = "list"
}
