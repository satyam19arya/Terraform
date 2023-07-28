locals {
  instances = {
    "Dev"     = "ami-0574da719dca65348"
    "Staging" = "ami-0b0dcb5067f052a63"
    "Testing" = "ami-0574da719dca65348"
    "Prod"    = "ami-0b0dcb5067f052a63"
  }
}

resource "aws_instance" "web" {
  for_each      = local.instances
  ami           = each.value
  instance_type = "t2.micro"
  tags = {
    Name = each.key
  }
}