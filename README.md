Installation Prerequisites
Install Terraform on your local machine.
Have an AWS IAM User Account and create access keys.

﻿Installation Overview
There are two high level steps in this automation:

Prepare your config file.
Use Terraform to provision the resources in the terraform folder.

Installation Steps
Preparation	
1.Clone this repository.
2.At the root of this repository, manually create the following file.
./.aws/config
3.Add the following content to ./.aws/config
export AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
export AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>

4.Run source ./.aws/config
5.Run cd terraform
6.Run terraform init


Configure Terraform Variables
The variables.tf file contains several variables that you may want to modify such as specific Ami images, instance types and other settings.

.Required - Replace the local_ssh_pubkey default value to ~/.ssh/id_ed25519.pub (default) This automation uses your pre-existing public key to access the remote Debian instances. If you don't yet have one in the ~/.ssh folder, create one with this command ssh-keygen -t ed25519


Run Terraform Apply
Run terraform apply
The provisioning will take a while, but the command execution should show the progress.


Cleanup
To remove all created AWS resources, run the following command on your local machine in the terraform folder:

terraform destroy
