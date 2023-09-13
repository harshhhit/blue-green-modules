# Create public and private subnets in each availability zone
resource "aws_subnet""public_subnet" {
  count = length(var.availability_zones)
  vpc_id = var.vpc_id
  cidr_block = var.cidr_block
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${project_name}-${count.index}"
  }
}

resource "aws_subnet""private_subnet" {
  count = length(var.availability_zones)
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.cidr_block
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "private-subnet-{project_name}-${count.index}"
  }
}



# count is a meta-argument in Terraform that allows you to create 
# multiple instances of a resource based on the length of a given 
# list or similar data structure. In your code, you're using count 
# to create subnets in multiple availability zones, and the length of var.a
# vailability_zones determines how many subnets will be created.

# Count.index is inbuild veriable in Terraform