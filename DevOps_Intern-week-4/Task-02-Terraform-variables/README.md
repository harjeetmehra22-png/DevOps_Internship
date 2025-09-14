
# Terraform Practical: Variables, tfvars, and Outputs

This practical exercise demonstrates how to use **variables**, **tfvars**, and **outputs** in Terraform to create a local file. These features make Terraform configurations reusable, environment-specific, and production-ready.

## 📁 Project Structure
```
terraform-variables/
├── main.tf
├── variables.tf
├── outputs.tf
└── terraform.tfvars
```

## 🧠 Learning Objectives
- Understand Terraform workflow with variables and outputs.
- Learn how to override default values using tfvars.
- Use outputs to share values across modules or CI/CD pipelines.

## 🛠️ Step-by-Step Instructions

### Step 1 — Create a New Folder
```bash
mkdir terraform-variables
cd terraform-variables
```
Keeps projects isolated. Terraform creates a state file in this folder.

### Step 2 — Create `main.tf`
Defines the provider (`local`) and resource (`local_file`) using variables.
```hcl
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "example" {
  content  = var.file_content
  filename = "${path.module}/${var.file_name}"
}
```

### Step 3 — Create `variables.tf`
Defines input variables with default values.
```hcl
variable "file_name" {
  description = "The name of the file"
  type        = string
  default     = "hello.txt"
}

variable "file_content" {
  description = "The file content"
  type        = string
  default     = "Learning Terraform Variables!"
}
```

### Step 4 — Create `outputs.tf`
Displays the file path after applying the configuration.
```hcl
output "file_path" {
  description = "Path of the file created"
  value       = local_file.example.filename
}
```

### Step 5 — Initialize Terraform
```bash
terraform init
```
Downloads provider plugins.

### Step 6 — Validate Configuration
```bash
terraform validate
```
Ensures `.tf` files are syntactically valid.

### Step 7 — Preview the Plan
```bash
terraform plan
```
Shows what Terraform will create or change.

### Step 8 — Apply Changes
```bash
terraform apply
```
Type `yes` to confirm. This creates the file and shows the output.

### Step 9 — Create `terraform.tfvars`
Overrides default variable values.
```hcl
file_name    = "greeting.txt"
file_content = "Hello from tfvars file!"
```
Run:
```bash
terraform plan
terraform apply
```
Useful for managing different environments.

### Step 10 — Destroy Resources
```bash
terraform destroy
```
Cleans up resources.

## ✅ Outcome
By completing this lab, you will:
- Understand how variables and tfvars make configs reusable.
- Learn how outputs are used to share values (e.g., EC2 IPs).
