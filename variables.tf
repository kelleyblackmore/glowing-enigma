# Required Variables
variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

# Tag Variables
variable "default_tags" {
  description = "Default tags to apply to the EC2 instance"
  type        = map(string)
  default = {
    ManagedBy   = "Terraform"
    Environment = "dev"
  }
}

variable "extra_tags" {
  description = "Additional tags to apply to the EC2 instance (merged with default_tags)"
  type        = map(string)
  default     = {}
}
