variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) > 0
    error_message = "Availability zones list must not be empty."
  }
}

# this validation is on length we can put velidation 
# in other was also go to root and see


variable "vpc_id" {
    description = "created in root "
    type = string
}









    
# variable "infra_env" {
#   type        = string
#   description = "infrastructure environment"
# }





# variable "public_subnet_numbers" {
#   type = map(number)
 
#   description = "Map of AZ to a number that should be used for public subnets"
 
#   default = {
#     "us-east-2a" = 1
#     "us-east-2b" = 2
#     "us-east-2c" = 3
#   }
# }
 
# variable "private_subnet_numbers" {
#   type = map(number)
 
#   description = "Map of AZ to a number that should be used for private subnets"
 
#   default = {
#     "us-east-2a" = 4
#     "us-east-2b" = 5
#     "us-east-2c" = 6
#   }
# }