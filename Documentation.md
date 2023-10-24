## Purpose

## Creating new key pair

Used the linked steps to create a new key pair and attach the new private key to all the new instances
[Steps: ](https://github.com/SaraGurungLABS01/Others.git/Key_Pair.md).

## Building our own Infrastructure using Terraform

Terraform as Infrastructure as code manages and provisions infrastructure through code instead of through manual process. Prior to this deployment, we were configuring infrastructure resources through AWS Cloud UI.

In this Terraform-based infrastructure provisioning project, we've crafted a robust environment in Amazon Web Services to host our web application and streamline deployment processes. At the heart of this architecture is an Amazon Virtual Private Cloud (VPC) that provides network isolation and control. Within the VPC, we've established two Availability Zones (AZs) to enhance availability and fault tolerance. The VPC further contains two public subnets to house our Amazon Elastic Compute Cloud (EC2) instances. These EC2 instances play a pivotal role—our first instance serves as a Jenkins automation server, allowing for continuous integration and deployment, while the second serves as the jenkin agent and the first  application server and the third one for second application server. To ensure secure access, we've employed a custom security group that regulates incoming and outgoing traffic for the instances on specified ports (8080, 8000, and 22). To route traffic appropriately, we've configured a dedicated route table. These resources collectively form a resilient and scalable infrastructure, empowering us to maintain and deploy our application with efficiency and security.

The `main.tf` and `variables.tf` files in this repository play a crucial role in defining the AWS resources to be created and declaring variables for configuration. Let's take a closer look at the `main.tf` file by [clicking here](https://github.com/SaraGurungLABS01/Deployment_5.1.git/main.tf). Reviewing this file can provide more insight into the AWS infrastructure and configurations that support our deployment process.

## Jenkins Installation/Configuration and SSH connection in first instance

**1: Install Jenkins**
- Followed the official Jenkins installation documentation 

**2: Create a Jenkins User and Log In**
- Created a Jenkins user account.
- Set up a password for the Jenkins user.

**3: Software Installation**
- Logged in as the Ubuntu user.
- Installed the following software packages:
   - `software-properties-common`
   - `python3.7`
   - `python3.7-venv`
   - Installed plugin `Pipeline Keep Running Step`

**Automation Scripts**:

- The `jenkins.sh` script was used to automate the Jenkins installation process.

## Software configuration in second and third instance
Similar to software configuration in first instance following software packages were installed:
   - `software-properties-common`
   - `python3.7`
   - `python3.7-venv`
Similarly, `installation.sh` script was used to automate the software installation process.

## Jenkin Agent

Follow the steps to set up a Jenkin Agent : [Create a Jenkins Agent](https://scribehow.com/shared/Step-by-step_Guide_Creating_an_Agent_in_Jenkins__xeyUT01pSAiWXC3qN42q5w)




