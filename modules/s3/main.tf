resource "aws_s3_bucket" "emr_logs" {
  bucket = "my-emr-logs-bucket"
  force_destroy = true
}