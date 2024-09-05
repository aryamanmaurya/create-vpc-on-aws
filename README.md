
# AWS VPC Terraform Configuration

This repository contains Terraform configuration files to set up a Virtual Private Cloud (VPC) in AWS with public and private subnets, route tables, and an internet gateway. The configuration is customizable via input variables.

## Resources Created

The following AWS resources are created using this configuration:

- **VPC**: A Virtual Private Cloud with DNS support and DNS hostnames enabled.
- **Subnets**: One public and one private subnet in the specified availability zone.
- **Internet Gateway**: An Internet Gateway for external connectivity in the public subnet.
- **Route Tables**: Separate route tables for public and private subnets, with an internet gateway route for the public subnet.
- **Route Table Associations**: Associations between the subnets and their corresponding route tables.

## Files

- **`main.tf`**: Defines the AWS resources.
- **`variables.tf`**: Contains variables to customize the setup (e.g., region, CIDR block, VPC name).

## Usage

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.
- AWS account credentials configured (e.g., using `aws configure`).

### Steps

1. Clone the repository:

   \`\`\`bash
   git clone https://github.com/aryamanmaurya/create-vpc-on-aws
   cd create-vpc-on-aws.git
   \`\`\`

2. Initialize the Terraform configuration:

   \`\`\`bash
   terraform init
   \`\`\`

3. Customize variables in the `variables.tf` file if needed.

4. Plan and apply the configuration:

   \`\`\`bash
   terraform plan
   terraform apply
   \`\`\`

5. Confirm the apply step to create the resources.

### Input Variables

You can modify the following input variables in the `variables.tf` file:

- **`region`**: AWS region where the VPC will be created. Default is `ap-south-1`.
- **`cidr_block`**: CIDR block for the VPC. Default is `10.0.0.0/16`.
- **`vpc_name`**: Name of the VPC. Default is `project-vpc`.

## Outputs

After applying the configuration, Terraform will output the VPC ID, public subnet ID, and private subnet ID.
