variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  # Default to Amazon Linux 2 AMI (update this for your region)
  default = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  description = "The instance type to use"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name for the EC2 instance"
  type        = string
  default     = "example-ec2-with-tags"
}
