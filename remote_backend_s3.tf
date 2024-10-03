terraform {
  backend "s3" {
    bucket = "dev-terraform-jenkins-pk11"
    key = "devops-project/jenkins/terraform.tfstate"
    region = "eu-central-1"
  }
}