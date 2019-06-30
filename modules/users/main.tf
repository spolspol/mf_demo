/*
    module resources
*/

#   set counters for iteration using local variables

locals {
  count_environments  = "${length(var.environments)}"
  count_users         = "${length(var.users)}"
  count_joint			    = "${local.count_environments * local.count_users}"
}

#   create resoucres

resource "aws_iam_user" "user" {
  count = "${local.count_joint}"
  
  name = "${element(var.users, count.index/local.count_environments)}-${element(var.environments, count.index)}"

  tags = {
    tag-key = "${element(var.users, count.index/local.count_environments)}-${element(var.environments, count.index)}"
  }
}

resource "aws_iam_access_key" "key" {
  count = "${local.count_joint}"

  user = "${element(aws_iam_user.user.*.name, count.index)}"
}
