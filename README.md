# Terraform
Terraform is an open-source infrastructure as code (IaC) tool developed by HashiCorp. It allows users to manage and provision infrastructure resources, such as virtual machines, networks, and storage, in a declarative way.

### Providers
A "provider" is a plugin that allows Terraform to interact with various cloud providers, services, or infrastructure platforms. In order to make provider available on Terraform we need to make a terraform init. This commands download any plugins we need for our providers.

### terraform init
This commands download any plugins we need for our providers. It also initialize a working directory containing terraform configuration files.

`
terraform init 
`

### terraform validate 
terraform validate is a command used to validate the syntax and configuration of your Terraform files.

`
terraform validate
`

### terraform plan
terraform plan is a command used to create an execution plan. It examines the current Terraform configuration and compares it to the state of the infrastructure as recorded in the Terraform state file. terraform plan is a safe command to run as it does not make any changes to the actual infrastructure.

`
terraform plan
`

### terraform apply 
The terraform apply command executes the actions proposed in a terraform plan. 

`
terraform apply
`

### terraform destroy
terraform destroy is a command used to destroy the resources that were created and managed by Terraform in your infrastructure.

`
terraform destroy
`

### terraform output
This command will display all the declared outputs and their corresponding values. These outputs can be useful for displaying important information, such as IP addresses, resource IDs, or any other data

`
terraform output
`

### terraform refresh
This command instructs Terraform to update its state file by querying the infrastructure resources currently in use. It does not make any changes to the resources themselves; instead, it updates the state to match the current real-world state of the infrastructure.

`
terraform refresh
`

### terraform fmt
This command is used to automatically format Terraform configuration files to ensure consistent and readable code

`
terraform fmt
`

### terraform apply -replace="" (terraform taint)
The -replace option with terraform apply to force Terraform to replace an object even though there are no configuration changes that would require it.
```
terraform apply -replace="aws_instance.web"
```

### Terraform graph
The terraform graph command is used to generate a visual representation of either a configuration or execution plan. The output is in the DOT format, which can easily be converted to an image by GraphViz to generate charts.

`
terraform graph | graph.dot
apt install graphviz
vi graph.dot
cat graph.dot | dot -Tsvg > graph.svg
`

###  Debugging Terraform
Terraform has detailed logs which can be enabled by setting the TF_LOG environment variable to any value.
You can set TF_LOG to one of the log levels TRACE, DEBUG, INFO, WARN or ERROR to change the verbosity of the logs

Note : To persist logged output you can set TF_LOG_PATH in order to force the log to always be appended to a specific file when logging is enabled

### HCL
HCL (HashiCorp Configuration Language) is the primary language used for writing configuration files. HCL is used to define and configure infrastructure resources and settings in a declarative manner. Terraform uses HCL to interpret the infrastructure requirements specified in the configuration files and take appropriate actions to create, modify, or delete resources accordingly.

### Terraform TFState File
When we build infrastructure with terraform configuration, a state file will be created automatically in the local workspace directory named “terraform.tfstate”. This tfstate file will have information about the provisioned infrastructure which terraform manage. Whenever we make changes to the configuration file, it will automatically determine which part of your configuration is already created. And, also it will determine which needs to be changed with the help of the state file.

### Terraform Backend with Locking
In Terraform, a backend is a configuration that determines how state files are stored and accessed. The state file contains important information about the resources managed by Terraform, such as resource IDs, metadata, and dependencies. Using a backend is essential when you work in a team or across multiple environments to maintain a consistent and shared state.
When multiple team members are working with Terraform concurrently, there's a possibility of conflicts if they try to modify the same infrastructure simultaneously. To prevent such conflicts and maintain data integrity, Terraform provides a locking mechanism for backends. Locking ensures that only one process can make changes to the infrastructure at a given time, while others are put on hold until the lock is released.

By default, Terraform uses the "local" backend, which is the normal behavior of Terraform you're used to.
