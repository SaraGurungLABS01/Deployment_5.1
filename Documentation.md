## Purpose

The goal of this deployment project is to effectively employ a Jenkins agent in the deployment process of a Banking Flask application on Amazon EC2 instances. This project involves establishing a distinct GitHub repository, orchestrating the necessary AWS infrastructure, configuring Jenkins with a Jenkins agent, and seamlessly deploying the Flask application. The documentation is intended to serve as a comprehensive guide, ensuring clarity in each step of the process.


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

## Setting Jenkin Agent 'awsDeploy'

Follow the steps to set up a Jenkin Agent for 1st Application Server: [Create a Jenkins Agent](https://scribehow.com/shared/Step-by-step_Guide_Creating_an_Agent_in_Jenkins__xeyUT01pSAiWXC3qN42q5w)

## Initial Deployment in first application instance

Created a multi branch pipeline and deploy the Retail Banking application

**Result**: Succesfully deployed the flask application

![image](https://github.com/SaraGurungLABS01/Deployment_5.1/assets/140760966/9f25829a-18e1-4452-bab9-b034e7414fff)

![image](https://github.com/SaraGurungLABS01/Deployment_5.1/assets/140760966/0a92df82-08f8-4acd-8b4b-8129b71c6237)

## Setting up Jenkin Agent 'awsDeploy2' for second deployment

Refer to the steps listed in the first deployment

Make sure to edit the jenkins file: 
![image](https://github.com/SaraGurungLABS01/Deployment_5.1/assets/140760966/b719f6a2-bba4-45b0-8101-38b0dded3d98)




## Second Deployment in second application instance

Ran the multi branch pipeline and deploy the Retail Banking application in the second application instance

**Result**: Succesfully deployed the flask application

![image](https://github.com/SaraGurungLABS01/Deployment_5.1/assets/140760966/951dd709-77f7-44a2-99f6-a2e419e139af)


## System Diagram

![Untitled Diagram drawio](https://github.com/SaraGurungLABS01/Deployment_5.1/assets/140760966/78634693-cd7e-4a02-a0c2-032ddc13d1b4)



## Optimization

- **Load Balancer**: To improve availability, a load balancer can be placed in front of application servers. This load balancer efficiently distributes incoming traffic across multiple EC2 instances, ensuring redundancy and enhanced availability. This way, even if one server experiences issues, the load balancer seamlessly redirects traffic to other healthy instances, maintaining a highly available application for users.

- **Auto Scaling**: To enhance availability, Auto Scaling groups can be employed to automatically adjust the number of EC2 instances based on traffic demand. This dynamic scaling ensures that the application can effectively handle varying workloads and maintains availability even during traffic spikes. If one instance encounters issues, Auto Scaling rapidly replaces it with a healthy one, contributing to a resilient and consistently available user experience.

- **Multi-Availability Zone Deployment**: For increased availability, consider expanding to multiple Availability Zones (AZs). This strategic deployment architecture enhances resilience against failures and offers users a more reliable and available service.

## Purpose of Using Jenkins Agent

A Jenkins agent plays a pivotal role in optimizing the Continuous Integration and Continuous Deployment (CI/CD) pipeline. Its key purposes are as follows:

- **Parallel Execution**: Jenkins agents enable parallel execution of tasks, significantly expediting the CI/CD process and facilitating the handling of larger workloads efficiently.

- **Distributed Builds**: These agents distribute builds and deployments across multiple nodes, making Jenkins suitable for various environments and configurations. This distributed approach enhances efficiency and resource utilization.

- **Resource Isolation**: Agents isolate resources for specific jobs, preventing interference between tasks and ensuring optimal resource allocation. This aids in maintaining consistency and predictability in the CI/CD process.

- **Platform Flexibility**: They can be configured on various machines with different operating systems and configurations, accommodating diverse project requirements. This flexibility is particularly valuable in multi-environment scenarios.

- **Scalability**: Jenkins agents can be easily scaled up or down based on workload demands, ensuring that they can effectively handle increased job requirements, contributing to a responsive CI/CD pipeline.

- **Fault Tolerance**: Agents provide fault tolerance, automatically redistributing tasks to other available agents in case of failures. This feature ensures the resilience of the CI/CD pipeline, even when faced with technical issues or server failures.
















