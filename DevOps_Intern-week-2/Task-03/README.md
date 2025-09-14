# AWS EC2 Practicals – Week 2 (Day-3)

## Overview
This module provides hands-on experience with Amazon EC2, focusing on instance creation, basic server setup, and lifecycle management. It’s designed to help interns understand the practical aspects of cloud infrastructure using Ubuntu-based EC2 instances.



## Practical 1 – Launch Your First Ubuntu EC2 Instance

**Goal:** Understand EC2 parameters and connect via SSH.

### Steps
- Launch EC2 instance with:
  - AMI: Ubuntu Server 22.04 LTS (Free Tier)
  - Instance type: t2.micro
  - Key Pair: Create and download `.pem` file
  - Storage: 8 GiB
  - Security Group: Allow SSH (port 22)
- Connect using:
  ```bash
  chmod 400 my-key.pem
  ssh -i my-key.pem ubuntu@<Public-IP>
 
- Run basic commands: 
  ```bash
  whoami
  uname -a
  df -h


## Practical 2 – Install & Run a Basic Web Serve

**Goal:** Learn package installation and port exposure.

### Steps
- SSH into EC2 instance
- Install Apache:
  ```bash
  sudo apt update -y
  sudo apt install apache2 -y

- Enable HTTP (port 80) in Security Group
- Visit http://<Public-IP> in browser
- Replace index.html with custom content


## Practical 3 – EC2 Lifecycle Management

**Goal:** Understand instance states and billing control

### Actions
- Practice:
- Stop – shuts down, IP changes on restart
- Start – boots instance again
- Reboot – restarts like a laptop
- Terminate – deletes permanently
- Always stop or terminate to save Free Tier credits


## Learning Outcomes
By completing these practicals, you will:
- Confidently launch and configure EC2 instances with SSH access
- Deploy and expose a basic web server using Apache
- Understand EC2 lifecycle operations and their impact on billing
- Build foundational skills for managing cloud-based Linux servers
