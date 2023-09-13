# resource "aws_security_group" "securitygroup" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.virtual1.id




resource "aws_security_group""sgw ${project_name}"{
    vpc_id = var.vpc_id
    name = "sgw-${project_name}"
    description "Allow TLS inbound traffic"


 dynamic “ingress” {
  for_each = local.inbound_ports
  content {
   from_port = ingress.value
   to_port = ingress.value
   protocol = “tcp”
   cidr_blocks = [ “0.0.0.0/0” ]
  }
 }


 dynamic “egress” {
  for_each = local.outbound_ports
  content {
   from_port = egress.value
   to_port = egress.value
   protocol = “tcp”
   cidr_blocks = [vpc_cidr_block]
  }
 }
}