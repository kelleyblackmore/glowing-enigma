# EC2 Terraform Module

This Terraform module creates an AWS EC2 instance with support for custom default tags and additional extra tags.

## Features

- Creates a single EC2 instance
- Supports custom default tags that are applied to all instances
- Allows passing extra tags that are merged with default tags
- Configurable instance type and AMI
- Outputs key instance information

## Usage

### Basic Example

```hcl
module "ec2_instance" {
  source = "./path/to/module"

  ami_id        = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  instance_name = "my-web-server"
}
```

### Example with Custom Default Tags

```hcl
module "ec2_instance" {
  source = "./path/to/module"

  ami_id        = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.small"
  instance_name = "my-app-server"
  
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = "production"
    Team        = "DevOps"
  }
}
```

### Example with Extra Tags

```hcl
module "ec2_instance" {
  source = "./path/to/module"

  ami_id        = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.medium"
  instance_name = "my-database-server"
  
  extra_tags = {
    Project     = "MyProject"
    CostCenter  = "Engineering"
    Owner       = "john.doe@example.com"
  }
}
```

### Example with Both Custom Default Tags and Extra Tags

```hcl
module "ec2_instance" {
  source = "./path/to/module"

  ami_id        = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.small"
  instance_name = "my-api-server"
  
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = "staging"
    Application = "API"
  }
  
  extra_tags = {
    Version     = "v2.0"
    Compliance  = "HIPAA"
    BackupPolicy = "Daily"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami_id | The AMI ID to use for the EC2 instance | `string` | n/a | yes |
| instance_type | The instance type to use for the EC2 instance | `string` | `"t2.micro"` | no |
| instance_name | Name tag for the EC2 instance | `string` | n/a | yes |
| default_tags | Default tags to apply to the EC2 instance | `map(string)` | `{"ManagedBy": "Terraform", "Environment": "dev"}` | no |
| extra_tags | Additional tags to apply to the EC2 instance (merged with default_tags) | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | The ID of the EC2 instance |
| instance_arn | The ARN of the EC2 instance |
| instance_public_ip | The public IP address of the EC2 instance |
| instance_private_ip | The private IP address of the EC2 instance |
| instance_tags | The tags applied to the EC2 instance |

## Tag Merging Behavior

Tags are merged in the following order (later values override earlier ones):
1. `default_tags` - Base tags for the instance
2. `extra_tags` - Additional user-provided tags
3. `Name` tag - Always set to the value of `instance_name` variable

This means that if you specify a tag in both `default_tags` and `extra_tags`, the value from `extra_tags` will take precedence.

## Requirements

- Terraform >= 0.12
- AWS Provider

## License

This module is open source.