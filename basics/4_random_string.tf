# Define the random_string resource to generate a random string
resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = ":!@#$%^&*()[]{}<>:"
}

output "read-str" {
  value = random_string.random[*].result
}