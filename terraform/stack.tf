/*
    terraform stack 
*/

#   modules

module "users" {
  source        = "../modules/users"
  users         = "${var.list_of_users}"
  environments  = "${var.list_of_environments}"
}


#   outputs

output "credentials" {
  value = "${
      formatlist(
        "%s %s %s",
        module.users.username,
        module.users.access_key,
        module.users.secret_access_key
  )}"
}
