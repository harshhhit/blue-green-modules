variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) for the EC2 instance."
  type     = string
}

variable "instance_type" {
  description = "The type of EC2 instance to create."
  type = string
  
}
