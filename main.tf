provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "s3" {
  source = "./modules/s3"
}

module "emr" {
  source                 = "./modules/emr"
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  master_sg_id           = module.security_group.master_sg_id
  slave_sg_id            = module.security_group.slave_sg_id
  log_bucket             = module.s3.bucket_name
}