# Complete Example for EC2 Module with Tags

This example demonstrates how to use the EC2 module with both default tags and extra tags.

## Usage

1. Update the `terraform.tfvars` file with your specific values
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Review the plan:
   ```bash
   terraform plan
   ```
4. Apply the configuration:
   ```bash
   terraform apply
   ```

## Resources Created

- 1 EC2 instance with merged tags from default_tags and extra_tags

## Outputs

The example will output the instance ID, ARN, IPs, and applied tags.
