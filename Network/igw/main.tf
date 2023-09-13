# IGW and NGW
##
resource "aws_internet_gateway""igw" {
  vpc_id = var.vpc_id
 
  tags = {
    Name        = "IGW-${var.project_name}-vpc"
   
  }
}

