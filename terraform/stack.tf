/*
    terraform stack 
*/

module "qbe-eo-staging" {
  source        = "../modules/users"
  users         = "${var.list_of_users}"
  environments  = "${var.list_of_environments}"
}
