output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2_with_tags.instance_id
}

output "instance_arn" {
  description = "The ARN of the EC2 instance"
  value       = module.ec2_with_tags.instance_arn
}

output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.ec2_with_tags.instance_public_ip
}

output "instance_private_ip" {
  description = "The private IP of the EC2 instance"
  value       = module.ec2_with_tags.instance_private_ip
}

output "instance_tags" {
  description = "All tags applied to the EC2 instance"
  value       = module.ec2_with_tags.instance_tags
}
