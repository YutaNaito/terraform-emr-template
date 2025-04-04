output "master_sg_id" {
  value = aws_security_group.emr_sg.id
}
output "slave_sg_id" {
  value = aws_security_group.emr_sg.id
}