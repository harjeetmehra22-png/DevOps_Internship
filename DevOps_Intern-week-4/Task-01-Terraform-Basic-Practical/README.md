# Terraform Practical (Local) — First Hands-On

This lab is for beginners to understand how Terraform works. We will not use AWS here, only create a simple file on your local machine using Terraform.

---

## Commands You Should Know
- `pwd` → shows current folder
- `ls` → shows list of files
- `mkdir tf-lab` → makes a new folder
- `cd tf-lab` → go inside folder
- `nano file.tf` → open file in nano editor

Check installation:
- `terraform -version` → check Terraform is installed
- `aws --version` → check AWS CLI (not needed now, but useful later)
- `git --version` → check Git is installed (optional)

---

## Practical 1: Create a Local File

### Step 1: Make a new folder
```bash
mkdir terraform-local
cd terraform-local

   - Create and navigate to terraform-local/

2. Write Terraform Configuration:

   - Define provider and resource in main.tf:
     terraform {
       required_providers {
         local = {
           source  = "hashicorp/local"
           version = "~> 2.0"
         }
       }
     }

     provider "local" {}

     resource "local_file" "hello" {
       content  = "Hello, Terraform Interns!"
       filename = "${path.module}/hello.txt"
     }

3. Initialize Terraform
   - Run: terraform init

4. Preview Changes
   - Run: terraform plan

5. Apply Configuration
   - Run: terraform apply -auto-approve
   - Verify: cat hello.txt

6. Destroy Infrastructure
   - Run: terraform destroy -auto-approve

### Learning Outcomes:


Step 1: Project Setup
- Importance of clean folder structure for Terraform

Step 2: Configuration
- Defining providers and resources in HCL

Step 3: Initialization
- How Terraform downloads plugins and prepares the project

Step 4: Planning
- Previewing infrastructure changes before applying

Step 5: Apply
- Creating and managing resources declaratively

Step 6: Destroy
- Cleaning up resources to avoid clutter or cost
