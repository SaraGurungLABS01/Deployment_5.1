## Purpose

## Creating new key pair

Used the steps below to create a new key pair and attach the new private key to all the new instances
[Steps: ](https://github.com/SaraGurungLABS01/Others.git/Key_Pair.md).

## Building our own Infrastructure using Terraform

Terraform as Infrastructure as code manages and provisions infrastructure through code instead of through manual process. Prior to this deployment, we were configuring infrastructure resources through AWS Cloud UI.

In this Terraform-based infrastructure provisioning project, we've crafted a robust environment in Amazon Web Services to host our web application and streamline deployment processes. At the heart of this architecture is an Amazon Virtual Private Cloud (VPC) that provides network isolation and control. Within the VPC, we've established two Availability Zones (AZs) to enhance availability and fault tolerance. The VPC further contains two public subnets to house our Amazon Elastic Compute Cloud (EC2) instances. These EC2 instances play a pivotal role—our first instance serves as a Jenkins automation server, allowing for continuous integration and deployment, while the second hosts the application. To ensure secure access, we've employed a custom security group that regulates incoming and outgoing traffic for the instances on specified ports (8080, 8000, and 22). To route traffic appropriately, we've configured a dedicated route table. These resources collectively form a resilient and scalable infrastructure, empowering us to maintain and deploy our application with efficiency and security.

The `main.tf` and `variables.tf` files in this repository play a crucial role in defining the AWS resources to be created and declaring variables for configuration. Let's take a closer look at the `main.tf` file by [clicking here](https://github.com/SaraGurungLABS01/Deployment_5.git/main.tf). Reviewing this file can provide more insight into the AWS infrastructure and configurations that support our deployment process.


