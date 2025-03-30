# 🚀 AWS Multi-Tier Terraform Project  

This repository contains Terraform scripts to deploy a **highly available multi-tier architecture** on **AWS**, using **Infrastructure as Code (IaC)** principles.

## 🌍 Project Overview  

This Terraform configuration automates the deployment of a multi-tier infrastructure that includes:  

✅ **Networking**: VPC, Subnets, Internet Gateway, NAT Gateway, Route Tables  
✅ **Compute**: EC2 instances for Web and Application tiers  
✅ **Database**: RDS (Relational Database Service)  
✅ **Load Balancing**: Application Load Balancer (ALB)  
✅ **Security**: IAM roles, Security Groups, S3 bucket for remote state storage  
✅ **Automation**: Terraform modules for better reusability  

---

## 🏗️ Architecture Diagram  

```txt
   Users
     │
     ▼
  [ALB - Load Balancer] 
     │
     ▼
  [EC2 - Web Tier] 
     │
     ▼
  [EC2 - App Tier] 
     │
     ▼
  [RDS - Database Tier]

🛠️ Prerequisites
Ensure you have the following installed on your system before running the Terraform scripts:

Terraform (≥ 1.5.0) → Download

AWS CLI (≥ 2.0) → Download

Git (for cloning the repository)

🚀 Getting Started
1️⃣ Clone the Repository

git clone https://github.com/CloudEngineerAbiran/aws-multi-tier-terraform.git
cd aws-multi-tier-terraform
2️⃣ Initialize Terraform

terraform init
3️⃣ Validate Terraform Configuration

terraform validate
4️⃣ Plan and Apply Terraform

terraform plan
terraform apply -auto-approve
5️⃣ Destroy the Infrastructure (Optional)

terraform destroy -auto-approve
📂 Project Structure

aws-multi-tier-terraform/
│── terraform/             # Terraform configurations
│   ├── vpc.tf             # VPC and Subnets
│   ├── security.tf        # Security Groups & IAM Roles
│   ├── compute.tf         # EC2 instances for web & app tiers
│   ├── database.tf        # RDS instance
│   ├── load_balancer.tf   # Application Load Balancer
│   ├── backend.tf         # Remote state backend (S3)
│   ├── variables.tf       # Input variables
│   ├── outputs.tf         # Outputs (e.g., ALB URL, DB endpoint)
│   ├── provider.tf        # AWS Provider configuration
│   ├── terraform.tfvars   # Variables file (Git ignored)
│── app/                   # Application code (if any)
│── scripts/               # Bash scripts for automation
│── README.md              # Project Documentation
│── .gitignore             # Files to be ignored in Git
🔗 References
Terraform AWS Provider

Terraform Best Practices

💡 Contributing
Feel free to submit issues and pull requests for improvements!

🔹 Author: CloudEngineerAbiran
🔹 GitHub: CloudEngineerAbiran

🏆 License
This project is licensed under the MIT License.

kotlin
Copy
Edit
MIT License  

Copyright (c) 2024  
CloudEngineerAbiran  

Permission is hereby granted, free of charge, to any person obtaining a copy of this soft
