
# AWS Practical Lab (Free Tier)

## Overview
Hands-on lab using AWS Free Tier to explore EC2, S3, IAM, VPC, Subnets, and Web Servers.

## Part 1 — VPC & Subnets
- Create VPC: `interns-lab-vpc` (CIDR: 10.0.0.0/16)
- Subnets:
  - Public: `public-subnet-a` (10.0.1.0/24, public IP ON)
  - Private: `private-subnet-a` (10.0.2.0/24, public IP OFF)
- Internet Gateway + Route Tables:
  - `public-rt`: 0.0.0.0/0 → IGW
  - `private-rt`: local only

## Part 2 — Security Groups
- `nginx-sg`: SSH (22) My IP, HTTP (80) All
- `apache-sg`: HTTP (80) from `nginx-sg`

## Part 3 — EC2 & Web Servers
- Launch `nginx-server` in public subnet, install Nginx
- Launch `apache-server` in public subnet, install Apache
- Test Apache from Nginx using `curl`

## Part 4 — Nginx Reverse Proxy
- Configure Nginx to proxy to Apache private IP
- Reload Nginx and verify via browser

## Part 5 — S3 + IAM Role
- Create bucket `interns-lab-bucket-<name>`, enable versioning
- Upload `about.txt`, `logo.png`
- Create IAM Role `ec2-s3-readonly` with custom policy
- Attach role to Nginx server, install AWS CLI, test access

## Cleanup
- Stop/terminate EC2 instances
- Delete S3 bucket and objects
- Detach/delete IAM role
- Delete VPC if not needed
