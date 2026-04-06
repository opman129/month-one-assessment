# TechCorp Terraform Assessment
-----

## Overview
This project provisions a highly available and secure AWS infrastructure using Terraform.

## Architecture
- VPC with public and private subnets across 2 Availability Zones
- Internet Gateway and NAT Gateways for controlled internet access
- Bastion host for secure SSH access
- Web servers in private subnets behind an Application Load Balancer
- PostgreSQL database server in a private subnet
- Security groups enforcing least privilege access

## Prerequisites
- Terraform >= 1.0
- AWS CLI configured
- Existing AWS Key Pair

## File Structure
terraform-assessment/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── user_data/
│   ├── web_server_setup.sh
│   └── db_server_setup.sh
└── README.md

## Deployment Steps

1. Clone the repository

2. Initialize Terraform