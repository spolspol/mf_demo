/*
    module:       users
    description:  creates users from a list in AWS for list of environments
*/

#   set counters for iteration using local variables

locals {
  count_environments    = "${length(var.environments)}"
  count_users           = "${length(var.users)}"
  count_joint           = "${local.count_environments * local.count_users}"
}


#   create resoucres

resource "aws_iam_user" "user" {
  count = "${local.count_joint}"
  
  name = "${element(var.users, count.index/local.count_environments)}-${element(var.environments, count.index)}"

  path = "/${element(var.environments, count.index)}/"

  tags = {
    environment = "${element(var.environments, count.index)}"
  }
}

resource "aws_iam_access_key" "key" {
  count = "${local.count_joint}"

  user = "${element(aws_iam_user.user.*.name, count.index)}"
}


#   outputs

output "username" {
  value = "${aws_iam_user.user.*.name}"
}

output "access_key" {
  value = "${aws_iam_access_key.key.*.id}"
}

output "secret_access_key" {
  value = "${aws_iam_access_key.key.*.secret}"
}
