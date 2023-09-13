# # ec2 
#    resource "aws_instance""ec2" {
#   ami           = var.ami_id  # Replace with your desired AMI ID
#   instance_type = var.instance_type           # Change to your desired instance type
  
#   user_data = <<-EOF
#               #!/bin/bash
#               apt-get update -y
#               apt-get upgrade -y
#               EOF
  
#   tags = {
#     Name = "ExampleInstance ${var.project_name}"
#   }
# }




resource "aws_instance" "ubuntu1" {
    ami = "ami-08d4ac5b634553e16"
    count = 2
    instance_type = var.instance_type
    associate_public_ip_address = true
    security_group = [aws_security_group.igw.id]
    # iam_instance_profile =  aws_iam_instance_profile.ec2profile.name
    subnet_id = aws_subnet.public_subnet.id
    user_data = <<-EOF
                    #!/bin/bash

                    sudo apt update -y
                    sudo apt install ruby-full -y
                    sudo apt install wget -y 
                    sudo wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
                    sudo chmod +x ./install
                    sudo ./install auto  
                    sudo service codedeploy-agent status 
                    sudo service codedeploy-agent restart

                    EOF
   
     tags = {
    Name = "ExampleInstance ${var.project_name}"
  }

}


