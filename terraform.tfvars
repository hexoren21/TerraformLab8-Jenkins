bucket_name = "dev-terraform-jenkins-pk11"

vpc_cidr             = "10.10.0.0/16"
vpc_name             = "dev-proj-jenkins-eu-central-vpc"
cidr_public_subnet   = ["10.10.0.0/24", "10.10.1.0/24"]
cidr_private_subnet  = ["10.10.2.0/24", "10.10.3.0/24"]
eu_availability_zone = ["eu-central-1a", "eu-central-1b"]
public_key           = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDMP+1MjgvdpUv5YW6Lnj0cw2M6lvT2rQCfY0Ep7hchidksUoLmG/wzfhcyF8Zv1Ieew1xx+0TcxzvPed+IAEmSFBKT8Tlj9QgGkR2z1Q1/4BrQDvuXSJNYa37rsu2I+AYKgCqNGpsmugNVv09brtdonvNMbLtMwpSeQIlJumeUNYHluVXdshsrKj0I3zC0cjjXCCWBvIqvngQJQSAibRJ1yBQD6GTCMijFYBZqF6jDkBXw4JM1fTiUEyeiJ6WQ4opcj9nW7ZuRQmRZ/gHIBixgfZsbcRcb4f2wCdduXJP0cfZo7TqqH1GLTRzozbOHXubPnCHPrSd9eLzT02NteJjzwhOCaIaWKvo2DzyaumjMD3xtqvnwg/Pn5BYa60CJQu3mghGtL4vWW0/kyon0zNan5htr4LtEtFNn0aYLHPQfORuUYVcMO2ULM6/FbVrR/+bYDhg+xLc8rWgYfaNL7GoeXt69NHYIN1E90QbndgDB2NwDfpnoECJIceKqjSKM0w8= Administrator@LAPTOP-GQKPJ1U7"
ec2_ami_id           = "ami-0084a47cc718c111a"
my_ip                = "178.235.242.60/32"