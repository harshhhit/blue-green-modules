resource "aws_iam_role" "instancerole" {
  name = "role-${var.project_name}"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

# creating profile for ec2 and attach the above role
resource "aws_iam_instance_profile" "ec2profile" {
  name  = "ec2profile1112"
  role = aws_iam_role.instancerole.name
}