# Terraform State Practicals


This lab introduces interns to the concept of Terraform state. It covers how state is created, how it stores resource metadata, how renames are handled, and how drift is detected when changes occur outside Terraform.



### Practical 1 – State Basics: Create, Inspect, Understand
- Goal: Observe how terraform.tfstate is created and what it stores

**Steps:**

1. Create main.tf and write this code :
```hcl
terraform {
  required_providers {
    local = { source = "hashicorp/local", version = "~> 2.0" }
  }
}
provider "local" {}

resource "local_file" "demo" {
  filename = "${path.module}/state-demo.txt"
  content  = "hello-state"
}
```
2. Initialize Terraform (downloads provider):
```bash
terraform init
```
3. Preview the plan:
```bash
terraform plan
```
After this command Terraform will create `local_file.demo`.

4. Apply to create the file and update state:
```bash
terraform apply -auto-approve
```
5. Confirm the file was created:
```bash
ls -l state-demo.txt
cat state-demo.txt      
```
6. Inspect the state:
```bash
terraform state list

terraform state show local_file.demo

terraform show
```


### Practical 2 – Rename Resource Without Recreate
- Goal: Safely rename a resource in code without destroying it

**Steps:**

1. Edit main.tf and change the resource name from `demo` to `file_a`:
```hcl
resource "local_file" "file_a" {
  filename = "${path.module}/state-demo.txt"
  content  = "hello-state"
}
```
2. What happens if you just run `terraform plan` now:
```bash
terraform plan
```
It will show a “destroy + create” plan.

3. Use `terraform state mv` to update state without touching the real file:
```bash
terraform state mv local_file.demo local_file.file_a
```
This moves the state entry from the old address to the new one.
4. Again run plan :
```bash
terraform plan    # This time shows no changes
```

### Practical 3 – Drift & Refresh: Detect Outside Changes
- Goal: Detect and reconcile changes made outside Terraform

**Steps:**
1. Manually modify the file outside Terraform:
```bash
echo "changed-outside" > state-demo.txt
cat state-demo.txt    # shows: changed-outside
```  
2. Ask Terraform to plan:
```bash
terraform plan
```
You should see Terraform propose an update to restore content from the resource definition because the real file differs from state.
3. Apply to reconcile:
```bash
terraform apply -auto-approve
cat state-demo.txt    # now shows: hello-state
```

### Learning Outcomes:


- Understand what the Terraform state file is, how it gets created, and why it is needed.
- See how Terraform keeps track of resources using the state file so it knows what already exists.
- Safely rename resources using terraform state mv
- Detect when something changes outside of Terraform (drift) and bring it back in sync.
- Get comfortable with common commands like terraform state list, terraform state show, and terraform show.
