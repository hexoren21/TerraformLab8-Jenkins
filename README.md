# TerraformLab8-Jenkins

This repository contains Terraform configurations and scripts to set up a Continuous Integration and Continuous Deployment (CI/CD) pipeline using Jenkins, Docker, and SonarQube.

## Repository Structure

- **Docker-runner-script/**: Scripts to run Docker containers.
- **Docker/**: Docker-related configurations.
- **Jenkins-runner-script/**: Scripts to run Jenkins.
- **Jenkins/**: Jenkins configurations.
- **Networking/**: Network configurations.
- **Security-groups/**: Security group configurations.
- **SonarQube-runner-script/**: Scripts to run SonarQube.
- **SonarQube/**: SonarQube configurations.
- **certificate-manager/**: Certificate management configurations.
- **hosted-zone/**: Hosted zone configurations.
- **load-balancer-target-group/**: Load balancer target group configurations.
- **load-balancer/**: Load balancer configurations.
- **.gitignore**: Specifies files and directories to be ignored by Git.
- **main.tf**: Main Terraform configuration file.
- **provider.tf**: Provider configurations for Terraform.
- **remote_backend_s3.tf**: Configurations for remote state storage in S3.
- **terraform.tfvars**: Variable definitions for Terraform.
- **variables.tf**: Variable declarations for Terraform.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS credentials configured.
- [Docker](https://www.docker.com/get-started) installed.

## Setup Instructions

1. **Clone the Repository**

   ```bash
   git clone https://github.com/hexoren21/TerraformLab8-Jenkins.git
   cd TerraformLab8-Jenkins
   ```

2. **Initialize Terraform**

   ```bash
   terraform init
   ```

3. **Review and Modify Variables**

   Edit the `terraform.tfvars` file to set appropriate values for your environment.

4. **Plan and Apply Terraform Configurations**

   ```bash
   terraform plan
   terraform apply
   ```

5. **Start Jenkins and SonarQube**

   Use the scripts in the `Jenkins-runner-script/` and `SonarQube-runner-script/` directories to start Jenkins and SonarQube services.

## Usage

After setting up the infrastructure and services, you can access Jenkins and SonarQube through the load balancer's DNS name. Configure your CI/CD pipelines in Jenkins to utilize the infrastructure provisioned by Terraform.

## Cleanup

To destroy the infrastructure created by Terraform:

```bash
terraform destroy
```