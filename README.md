# Terraform
Terraform is an open-source infrastructure as code (IaC) tool developed by HashiCorp. It allows users to manage and provision infrastructure resources, such as virtual machines, networks, and storage, in a declarative way.

### Providers
A "provider" is a plugin that allows Terraform to interact with various cloud providers, services, or infrastructure platforms. In order to make provider available on Terraform we need to make a terraform init. This commands download any plugins we need for our providers.

### terraform init
This command is used to initialize a working directory containing terraform configuration files. It is safe to run this command multiple times. This command will never delete your existing configuration or state during init.

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

### HCL
HCL (HashiCorp Configuration Language) is the primary language used for writing configuration files. HCL is used to define and configure infrastructure resources and settings in a declarative manner. Terraform uses HCL to interpret the infrastructure requirements specified in the configuration files and take appropriate actions to create, modify, or delete resources accordingly.

Resource Blocks: HCL in Terraform uses resource blocks to define different types of infrastructure resources. Each resource block represents a specific resource type (e.g., AWS EC2 instance, Azure Virtual Machine, etc.) and contains key-value pairs that configure the resource.

Provider Blocks: Provider blocks are used to define and configure the cloud providers or services that Terraform will interact with. A provider block specifies the necessary information, such as access credentials and region, to manage resources in that provider.

### Terraform TFState File
When we build infrastructure with terraform configuration, a state file will be created automatically in the local workspace directory named “terraform.tfstate”. This tfstate file will have information about the provisioned infrastructure which terraform manage. Whenever we make changes to the configuration file, it will automatically determine which part of your configuration is already created. And, also it will determine which needs to be changed with the help of the state file.

### Terraform Backend with Locking
In Terraform, a backend is a configuration that determines how state files are stored and accessed. The state file contains important information about the resources managed by Terraform, such as resource IDs, metadata, and dependencies. Using a backend is essential when you work in a team or across multiple environments to maintain a consistent and shared state.
When multiple team members are working with Terraform concurrently, there's a possibility of conflicts if they try to modify the same infrastructure simultaneously. To prevent such conflicts and maintain data integrity, Terraform provides a locking mechanism for backends. Locking ensures that only one process can make changes to the infrastructure at a given time, while others are put on hold until the lock is released.

By default, Terraform uses the "local" backend, which is the normal behavior of Terraform you're used to.
