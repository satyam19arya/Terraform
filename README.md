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

### HCL
HCL (HashiCorp Configuration Language) is the primary language used for writing configuration files. HCL is used to define and configure infrastructure resources and settings in a declarative manner. Terraform uses HCL to interpret the infrastructure requirements specified in the configuration files and take appropriate actions to create, modify, or delete resources accordingly.

Resource Blocks: HCL in Terraform uses resource blocks to define different types of infrastructure resources. Each resource block represents a specific resource type (e.g., AWS EC2 instance, Azure Virtual Machine, etc.) and contains key-value pairs that configure the resource.

Provider Blocks: Provider blocks are used to define and configure the cloud providers or services that Terraform will interact with. A provider block specifies the necessary information, such as access credentials and region, to manage resources in that provider.
