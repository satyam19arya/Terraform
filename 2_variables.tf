variable username {}

output printname1 {
    value = "Hello, ${var.username}"
}

output printname2 {
    value = var.username
}