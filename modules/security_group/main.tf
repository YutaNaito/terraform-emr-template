resource "aws_security_group" "emr_sg" {
  vpc_id = var.vpc_id
}