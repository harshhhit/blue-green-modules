variable "project_name" {
  type = string
  description = "The name of your project."
  default     = "MyProject"  # Replace with your project name or provide a default
}


variable "aws_region" {
  type = string
  description = "The AWS region in which to create the EC2 instance."
  default     = "us-east-1"
}


# Define the availability zones in us-east-1
variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
# can validate in this or at subdirectory end
#  variable "availability_zones" {
#   default = ["us-east-1a", "us-east-1b", "us-east-1c"]

#   validation {
#     condition = alltrue([for az in var.availability_zones : can(regex("us-east-1[abcdefg]", az))])
#     error_message = "Invalid availability zone(s) provided. Please use valid us-east-1 availability zone names."
#   }
# }



variable "instance_type" {
  description = "The type of EC2 instance to create."
  default     = "t2.micro"
}

variable "cidr_block" {
  description = "The CIDR block for your VPC."

  default     = "10.0.0.0/16"  # Replace with your desired default CIDR block
}
  