resource "local_file" "devops" {
  filename = "/home/ubuntu/terraform-local/demo.txt"
  content  = "Hello Satyam"
}