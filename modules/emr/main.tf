resource "aws_emr_cluster" "emr_cluster" {
  name          = "my-emr-cluster"
  release_label = "emr-6.9.0"
  applications  = ["Hadoop", "Spark"]
  service_role  = "EMR_DefaultRole"
  log_uri       = "s3://${var.log_bucket}/logs/"

  ec2_attributes {
    key_name                          = var.key_name
    subnet_id                         = var.subnet_id
    emr_managed_master_security_group = var.master_sg_id
    emr_managed_slave_security_group  = var.slave_sg_id
  }

  master_instance_group {
    instance_type = "m5.xlarge"
  }

  core_instance_group {
    instance_type  = "m5.xlarge"
    instance_count = 2
  }
}