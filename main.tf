terraform {
  backend "s3" {
    bucket = "anoopbucket121"
    key    = "main"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source = "./vpc"
}

module "scgroup" {
  source = "./scgroup"
  vpcid = module.vpc.vpc-id
}

module "ami" {
  source = "./ami"
}

module "key" {
  source = "./key"
}

module "ec2" {
  source = "./ec2"
  amiid = module.ami.ami-id
  subnetid = module.vpc.subnet-id
  grpid = module.scgroup.grp-id
}
