# EC2 Instance Module
resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type

  # Merge default tags with extra tags provided by the user
  tags = merge(
    var.default_tags,
    var.extra_tags,
    {
      Name = var.instance_name
    }
  )
}
