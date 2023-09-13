module "name" {
    source = "./EC2"
     vpc_id = module.vpc.vpc.id
     subnet_id = module.subnet.public_subnet_id
    vpc_security_group_ids =module.securityfrp.securitygrp_id
}


module "subnet" {
    source = "./Network/subnet/"
    availability_zone = var.availability_zones
    vpc_id = module.vpc.vpc_id  # vpc_id is calling vpc module(vpc th at is created below)
    variable = cidr_block
}

module "igw" {
    source = "./Network/igw/"
    vpc_id = module.vpc.vpc_id
}

module "securty-grp" {
    source = "./Network/securitygrp"
    cidr_block = var.cidr_block
    vpc_id = module.vpc.vpc_id
}

module "vpc" {
    source = "./Network/vpc/"
    
    cidr_block = var.cidr_block
    project_name = var.project_name
    

}

module "routtable" {
    source = "./Network/routable"
    
    vpc_id = module.vpc.vpc_id
    igw_id = module.igw.igw_id
}
