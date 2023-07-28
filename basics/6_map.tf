variable "usersage" {
  type = map(any)
  default = {
    satyam = 20
    aman   = 19
  }
}

output "userage" {
  value = "My name is satyam and my age is ${lookup(var.usersage, "satyam")}"
}