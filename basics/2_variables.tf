variable "username" {}

output "printname1" {
  value = "Hello, ${var.username}"
}

output "printname2" {
  value = var.username
}

# Now we want to supply the variable value from the command line. so that we can run terraform plan command in non-interactive node.
# terraform plan -var "username=satyam"