# TechCorp Terraform Assessment
-------

## Overview
---

This project provisions a highly available and secure AWS infrastructure using Terraform. It includes a VPC with public and private subnets across multiple availability zones, a bastion host for secure access, web servers behind an Application Load Balancer, and a PostgreSQL database server.

---
## Prerequisites
---

Before deploying the infrastructure, ensure the following requirements are met:

---
### 1. Install Required Tools
---

- Terraform (v1.0 or later)
- AWS CLI (v2 recommended)

Verify installations:

```bash
terraform -v
aws --version

```

---
### 2. Configure AWS Credentials
---

Terraform requires valid AWS credentials to provision resources.

Run:

```bash
aws configure
```

Provide:
- AWS Access Key ID
- AWS Secret Access Key
- Default region: `us-east-1`
- Output format: `json`

To verify authentication:
```

aws sts get-caller-identity

```

---
### 3. Ensure Key Pair Exists
---

A key pair named `tech-corp` must exist in the `us-east-1` region.

To verify:

```bash

aws ec2 describe-key-pairs --region us-east-1

```

If it does not exist, create one via:
- AWS EC2 Console → Key Pairs → Create Key Pair  
OR
- AWS CLI

---
### 4. Clone Project
---

```bash

git clone month-one-assessment.git
cd terraform-assessment

```

---
## Deployment Instructions
---

Follow the steps below to deploy the infrastructure:


---
### Step 1: Initialize Terraform
---

Initializes the working directory and downloads required providers.

```

terraform init

```

---
### Step 2: Review Configuration
---

(Optional but recommended)

```

terraform validate

```

---
### Step 3: Review Execution Plan
---

Shows all resources that Terraform will create.

```bash

terraform plan

```

Carefully review:
- Resource creation
- Networking configuration
- Security group rules

---
### Step 4: Apply Configuration
---

Deploy the infrastructure:

```bash

terraform apply

```

Type:

```bash

yes

```
when prompted.

---
### Step 5: Verify Deployment
---

After successful deployment, Terraform will output:

- VPC ID  
- Load Balancer DNS Name  
- Bastion Public IP  

---
### Step 6: Access the Infrastructure
---

#### Access Web Application

Open a browser and navigate to:

```

http://<alb_dns_name>

```

You should see a simple HTML page showing the instance ID.

---
#### SSH into Bastion Host
---

```bash

ssh -i ~/Downloads/tech-corp.pem ec2-user@<bastion_public_ip>

```

---
#### Access Private Instances (via Bastion)

From the bastion host:

```bash
ssh ec2-user@<private-ip-of-web-or-db>

```

---
## Cleanup Instructions
---

To avoid unnecessary AWS charges, destroy all provisioned resources after use.

---

### Step 1: Destroy Infrastructure

```bash

terraform destroy

```

Type:
```

yes

```
when prompted.

---
### Step 2: Confirm Resource Deletion
---

Verify that all resources have been removed:

- EC2 Instances
- Load Balancer
- NAT Gateways
- VPC and Subnets

You can confirm via:
- AWS Console  
OR
- AWS CLI

---
### Step 3: Clean Local Files (Optional)
---

Remove Terraform state files if no longer needed:

```bash

rm -rf .terraform terraform.tfstate terraform.tfstate.backup

```

---
## Notes
---

- Ensure your IP address matches the value configured for SSH access.
- All infrastructure is deployed in `us-east-1`.
- NAT Gateways incur cost — ensure resources are destroyed after testing.
```
