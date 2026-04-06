variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name for resource tagging"
  type        = string
  default     = "techcorp"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_types" {
  description = "Instance types for different components"
  type = object({
    bastion = string
    web     = string
    db      = string
  })
  default = {
    bastion = "t3.micro"
    web     = "t3.micro"
    db      = "t3.small"
  }
}

variable "key_pair_name" {
  description = "AWS EC2 Key Pair name"
  type        = string
  default     = "tech-corp"
}

variable "allowed_ip" {
  description = "Your IP address for SSH access (CIDR format)"
  type        = string
  default     = "102.89.34.28/32"
}