#versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#providers
provider "aws" {
  region = "us-east-1"
}

# Resource - aws -ec2 -jenkins
resource "aws_instance" "jenkins" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = ["sg-0dc7bb6127d56baff"]
  iam_instance_profile   = var.iam_instance_profile
  user_data              = file("C:/Users/shivanand/repo_vcs/projects/jenkins.sh")

  tags = {
    Name      = "jenkins"
    CreatedBy = "IaC Terraform"
  }
}


# Resource - aws -ec2 -tomcat
resource "aws_instance" "tomcat" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = ["sg-0dc7bb6127d56baff"]
  iam_instance_profile   = var.iam_instance_profile
  user_data              = file("C:/Users/shivanand/repo_vcs/projects/tomcat.sh")

  tags = {
    Name      = "tomcat"
    CreatedBy = "IaC Terraform"
  }
}

# Resource - aws -ec2 -jfrog
resource "aws_instance" "jfrog" {
  ami                    = "ami-080e1f13689e07408"
  instance_type          = "t2.medium"
  key_name               = "8am"
  subnet_id              = "subnet-0791b04c3a38e251a"
  vpc_security_group_ids = ["sg-0dc7bb6127d56baff"]
  iam_instance_profile   = "8amSSMEC2"
  user_data              = file("C:/Users/shivanand/repo_vcs/projects/jfrog.sh")

  tags = {
    Name      = "jfrog"
    CreatedBy = "IaC Terraform"
  }
}

