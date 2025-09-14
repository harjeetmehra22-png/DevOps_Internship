# AWS Practical Lab (Free Tier)

⚠️ Use **t2.micro Free Tier**. Always **STOP instances** after each session to avoid charges.  
Take screenshots at **checkpoints**.

---

## Lab Tasks Overview

### 1. VPC & Subnets
- Create VPC: `interns-lab-vpc` (CIDR: `10.0.0.0/16`)
- Public Subnet: `10.0.1.0/24` (auto-assign public IP **ON**)
- Private Subnet: `10.0.2.0/24` (auto-assign **OFF**)
- Attach Internet Gateway and configure route tables
- ✅ **Checkpoint:** Screenshot subnet-to-route-table associations

---

### 2. Security Groups
- **nginx-sg**: SSH (22) from My IP, HTTP (80) from all
- **apache-sg**: HTTP (80) only from `nginx-sg`

---

### 3. EC2 Instances & Web Servers
- Launch **nginx-server** in public subnet → install Nginx
- Launch **apache-server** in public subnet → install Apache
- Test Apache from Nginx using `curl`
- ℹ️ **Note:** Apache stays in public subnet (NAT Gateway not Free Tier)

---

### 4. Nginx Reverse Proxy
- Configure Nginx to **proxy requests** to Apache
- Replace default config with custom proxy setup
- ✅ **Checkpoint:** Browser access to Nginx shows Apache page

---

### 5. S3 + IAM Role
- Create S3 bucket: `interns-lab-bucket-<name>` with versioning
- Upload `about.txt`, `logo.png`
- Create IAM Role: `ec2-s3-readonly` with custom policy
- Attach role to **nginx-server**
- Test access via AWS CLI
- ✅ **Checkpoint:** Apache serves `about.txt` from S3

---

## Learning Outcomes

**Task 1: VPC & Subnets**  
- CIDR planning  
- Public vs private subnet behavior  
- Route table configuration  

**Task 2: Security Groups**  
- Instance-level access control  
- Inter-SG communication  

**Task 3: EC2 & Web Servers**  
- EC2 provisioning  
- Package installation  
- Intra-VPC connectivity  

**Task 4: Reverse Proxy**  
- Nginx configuration  
- Proxying internal services  
- Config validation  

**Task 5: S3 + IAM Role**  
- IAM role attachment  
- Least privilege access  
- CLI-based S3 interaction  

---

## Cleanup Checklist
- Stop EC2 instances after each session  
- Terminate EC2 when done  
- Delete S3 bucket and objects  
- Detach and delete unused IAM roles  
- Remove VPC if no longer needed  
