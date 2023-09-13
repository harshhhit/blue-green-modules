variable "inbound_ports" {
  description = "List of inbound ports to allow in the security group."
  type        = list(number)
  default     = [80, 443,22]
}


variable "outbound_ports" {
  description = "List of outbound ports to allow in the security group."
  type        = list(number)
  default     = [443,22]
}

variable "vpc_cidr_block"
    description "the cider block is defined in the main file"
    default = string

variable "vpc_id"{
  type =string
}
  