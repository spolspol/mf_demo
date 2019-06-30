/*
    terraform stack 
*/

#   modules

module "users" {
  source        = "../modules/users"
  users         = "${var.list_of_users}"
  environments  = "${var.list_of_environments}"
}
