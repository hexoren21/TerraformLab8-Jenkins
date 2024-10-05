module "networking" {
    source = "./Networking"
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
    cidr_public_subnet = var.cidr_public_subnet
    cidr_private_subnet = var.cidr_private_subnet
    eu_availability_zone = var.eu_availability_zone
}

module "security_group" {
    source              = "./Security-groups"
    ec2_sg_name         = "SG for EC2 to enable SSH(22), HTTPS(443) and HTTP(80)"
    vpc_id              = module.networking.dev_proj_vpc_id
    ec2_jenkins_sg_name = "Allow port 8080 for jenkins"
}