output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS"
  value       = aws_lb.app_lb.dns_name
}

output "bastion_public_ip" {
  description = "Bastion Public IP"
  value       = aws_eip.bastion_eip.public_ip
}