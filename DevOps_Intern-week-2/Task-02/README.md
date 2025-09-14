# Week 2 - AWS Fundamentals (Day 2 Tasks)

## Part 1 - AWS Basics

**Goal:** Understand AWS at a very high level.

**Tasks:**

1. **What is AWS?**  
AWS (Amazon Web Services) is a cloud computing platform that provides on-demand infrastructure, storage, and other services over the internet.

2. **3 key reasons why companies choose AWS over traditional infrastructure:**  
- **Cost-effective:** Pay only for what you use, no upfront hardware investment.  
- **Scalable:** Easily scale up or down based on demand.  
- **Global reach:** Deploy applications worldwide with multiple regions and availability zones.

---

## Part 2 - Core AWS Services (DevOps Use-Cases)

**Goal:** Learn practical usage of core AWS services for DevOps.

| Service | Description | How it helps a DevOps engineer |
|---------|------------|-------------------------------|
| **EC2 (Elastic Compute Cloud)** | Virtual servers in the cloud | Can host apps, run CI/CD pipelines, and scale servers as needed. |
| **S3 (Simple Storage Service)** | Cloud storage | Store build artifacts, backups, logs, or even static website files. |
| **RDS (Relational Database Service)** | Managed database | Run production databases without manually handling backups or patches. |
| **VPC (Virtual Private Cloud)** | Networking isolation | Create secure Dev, QA, and Prod environments separated from the public network. |
| **IAM (Identity & Access Management)** | Security & access control | Manage which users or automation scripts can access AWS resources safely. |

---

## Part 3 - Applied Thinking (Scenario-Based)

**Scenario:** Setting up a new startup website.

1. **Hosting the website backend:**  
**Service:** EC2  
**Reason:** EC2 provides scalable virtual servers to run the website backend efficiently.

2. **Storing user-uploaded images:**  
**Service:** S3  
**Reason:** S3 is perfect for storing files like images securely and making them easily accessible.

3. **Managing user access for the team:**  
**Service:** IAM  
**Reason:** IAM allows you to control who can access which AWS resources for security and proper permissions.

---

## Part 4 - Self-Practice Exploration

**Task:** Explore one additional AWS service.  

- **Service:** AWS Lambda  
- **What it does:** Runs code without provisioning servers, triggered by events.  
- **How it helps in DevOps:** Can automate tasks, process files in S3, run serverless functions for CI/CD pipelines or monitoring.  

---

**Note:** These answers are concise and beginner-friendly. You can expand them with diagrams or examples when exploring AWS in the console.
