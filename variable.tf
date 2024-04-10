variable "ami" {
  default = "ami-080e1f13689e07408"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  default = "8am"
}
variable "subnet_id" {
  default = "subnet-0791b04c3a38e251a"
}
variable "vpc_security_group_ids" {
  default = "sg-0dc7bb6127d56baff"
}
variable "iam_instance_profile" {
  default = "8amSSMEC2"
}