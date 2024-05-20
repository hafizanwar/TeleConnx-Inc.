## Installation Prerequisites
* Install Terraform on your local machine.
* Have an AWS IAM User Account and create access keys. In order to successfully provision this reference architecture the user must also be permitted to create the following AWS resources:
   * VPC - AmazonVPCFullAccess
   * EC2 - AmazonEC2FullAccess
   * IAM Role - IAMFullAccess

## Installation Overview
There are two high level steps in this automation:

### Prepare your config file.
Use Terraform to provision the resources in the terraform folder.

### Installation Steps
### Preparation	
<ol><li> Clone this repository. </li>
<li> At the root of this repository, manually create the following file. </li>
./.aws/config
<li> Add the following content to ./.aws/config </li>
export AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID> </br>
export AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>

<li> Run source ./.aws/config </li>
<li> Run cd terraform </li>
<li> Run terraform init </li></ol>


## Configure Terraform Variables
The variables.tf file contains several variables that you may want to modify such as specific Ami images, instance types and other settings.

## Required
         Replace the local_ssh_pubkey default value to ~/.ssh/id_ed25519.pub (default) This automation uses your pre-existing public key to access the remote Debian instances. If you don't yet have one in the ~/.ssh folder, create one with this command ssh-keygen -t ed25519


Run Terraform Apply
Run terraform apply
The provisioning will take a while, but the command execution should show the progress.


## Cleanup infrastructure
To remove all created AWS resources, run the following command on your local machine in the terraform folder:

terraform destroy
