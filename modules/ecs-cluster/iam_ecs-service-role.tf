#resource "aws_iam_role" "ecs_service_role" {
#  name               = "ecs-service-role"
#  path = "/"
#  assume_role_policy = data.aws_iam_policy_document.ecs-service-policy.json
#}
#
#
#resource "aws_iam_role_policy_attachment" "ecs_service_role_attachment" {
#  role       = aws_iam_role.ecs_service_role.name
#  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
#}
#
#data "aws_iam_policy_document" "ecs-service-policy" {
#  statement {
#    actions = ["sts:AssumeRole"]
#
#    principals {
#      type        = "Service"
#      identifiers = ["ec2.amazonaws.com"]
#    }
#  }
#}