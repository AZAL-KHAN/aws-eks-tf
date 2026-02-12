## 🚀 AWS EKS Cluster Provisioning with Terraform

## 📌 Overview

This project provisions an Amazon EKS (Elastic Kubernetes Service) cluster on AWS using Terraform (Infrastructure as Code).

It automates the deployment of a fully functional Kubernetes environment with essential add-ons and proper remote state management for safe collaboration.

---

## 🏗️ What This Project Deploys

- AWS EKS Cluster

- Managed Node Group

- Metrics Server

- NGINX Ingress Controller

- gp3 Storage Class

- Remote Terraform State (S3 Backend)

- DynamoDB State Locking

- Makefile-based automation

---

## 📂 Repository Structure

```
aws-eks-tf/
├── vpc.tf          # VPC and networking configuration
├── eks.tf          # EKS cluster and node group configuration
├── addons.tf       # aws-ebs-csi-driver set up 
├── storage.tf      # gp3 Storage Class configuration
├── backend.tf      # S3 backend & DynamoDB state locking
├── providers.tf    # AWS provider configuration
├── variables.tf    # Input variables
├── outputs.tf      # Terraform outputs
├── Makefile        # Deployment automation (make setup / make destroy)
└── README.md       # Project documentation
```
---
## ⚙️ Infrastructure Components

## ☁️ EKS Cluster

- Provisioned using Terraform

- Configurable node groups

- Scalable Kubernetes control plane

---

## 📊 Metrics Server

- Enables resource metrics for:

- kubectl top

- Horizontal Pod Autoscaling (HPA)

--- 

## 🌐 NGINX Ingress Controller

- Handles external traffic routing

- Supports Ingress-based application exposure

---

## 💾 gp3 Storage Class

- Default EBS-backed storage class

- Optimized performance and cost efficiency

---

🔐 Remote State Management

## Terraform state is:

- 🪣 Stored securely in an AWS S3 bucket

- 🔒 Protected with DynamoDB state locking

**This prevents:**

- Concurrent Terraform executions

- State corruption

- Accidental infrastructure overwrites

---

## 🤖 Automation with Makefile

Infrastructure deployment and destruction are automated using a Makefile, simplifying operations.

This ensures:

- Consistent workflow

- Reduced manual errors

- Faster provisioning

---

## 🚀 Deploy the EKS Cluster

This project uses a Makefile to automate the Terraform workflow for provisioning the AWS EKS cluster.

**Create the EKS Cluster**

```
make setup
```

**This command:**

- Initializes Terraform

- Configures remote backend (S3)

- Applies Terraform configuration

- Provisions AWS EKS cluster

**Deploys:**

- Metrics Server

 - NGINX Ingress Controller

 - gp3 Storage Class

Runs the cluster in your AWS account

Once completed, your EKS cluster will be live and accessible via **kubectl**.

🔍 Verify the Cluster

After deployment:

```
kubectl get nodes
kubectl get pods
```

---

## Destroy the EKS Cluster

```
make destroy
```

This command:

- Destroys all Terraform-managed infrastructure

- Removes the EKS cluster and associated resources

- Uses DynamoDB state locking to prevent concurrent operations