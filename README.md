# 🚀 End-to-End CI/CD Pipeline with AWS, Terraform, Docker & GitHub Actions


## 📌 Project Overview

This project demonstrates a production-level *DevOps CI/CD pipeline* where infrastructure provisioning and application deployment are fully automated.

The system integrates:

- Infrastructure as Code (IaC) using Terraform
- Containerization using Docker
- Continuous Integration & Deployment using GitHub Actions
- Cloud deployment using AWS EC2
- Container registry using AWS ECR
- Notifications using Slack

This ensures scalable, consistent and automated deployments.

---

## 🔹 Key Features

✔ Infrastructure provisioning using Terraform  
✔ Docker containerized Node.js application  
✔ CI/CD pipeline using GitHub Actions  
✔ Docker image stored in AWS ECR  
✔ Automatic deployment on AWS EC2  
✔ Slack notifications integration  
✔ Migration from Jenkins to GitHub Actions  

---

## 🏗 Architecture

Developer → GitHub → GitHub Actions → Docker Build → AWS ECR → EC2 Deployment → Live App

Terraform provisions infrastructure resources automatically.

<img width="953" height="551" alt="580038626-379af4b2-d840-4def-aee3-d6818d6d7e55" src="https://github.com/user-attachments/assets/a6eca87d-8e88-4bb5-9112-cec10ebb8b4d" />

---

**🔧 Tech Stack**


- Node.js

- Express.js

- Terraform

- Docker

- GitHub Actions

- AWS EC2

- AWS ECR

- Git
---

**🏗 Architecture Decisions**
---
🔹 Why GitHub Actions instead of Jenkins?

Initially Jenkins was used for CI/CD pipeline. However, Jenkins requires dedicated server resources and continuous maintenance.

Issues faced:
- Jenkins consumed high memory on t3.micro
- Frequent crashes due to limited RAM
- Additional setup and plugin configuration required
- Maintenance overhead increased complexity
  
GitHub Actions provides:
- Fully managed CI/CD environment
- No infrastructure setup required
- Easy GitHub integration
- Faster pipeline execution
- Scalable and reliable workflow automation
 ---
🔹 Why Terraform?

Terraform is used for Infrastructure as Code (IaC).

Benefits:
- Automates infrastructure provisioning
- Infrastructure becomes version controlled
- Eliminates manual configuration errors
- Easy to reproduce environment
  
Terraform allows us to define AWS resources like:
- VPC
- EC2
- IAM roles
- Security Groups
- ECR repository
---
🔹 Why Docker?

Docker is used to containerize the application.

Benefits:
- Same environment in development and production
- Eliminates dependency issues
- Faster deployment
 --- 
🔹 Why AWS EC2?

AWS EC2 is used to host the application.

Benefits:
- Scalable compute capacity
- Easy integration with other AWS services
- Secure infrastructure
- Free tier available for learning
---  
🔹 Why AWS ECR?

Amazon Elastic Container Registry (ECR) is used to store Docker images.

Benefits:
- Secure private container registry
- Integrated with AWS IAM
- Easy access from EC2
- Version control for Docker images
---  
🔹 Why Slack Integration?

Slack used for real-time notifications.

Benefits:
- Instant build status alerts
- Failure notifications
- Team collaboration improvement
- Easy monitoring of pipeline activity


**📁 Project Structure**

<img width="1702" height="435" alt="580039198-97e81f33-1035-4101-a28c-13c7f4db92dd" src="https://github.com/user-attachments/assets/3ba94677-f1d9-4eb9-82e7-9eedf8a8b63a" />

---

**📁 Project Structure (Modular & Scalable Design)**
---
```bash
node.js-web-app/
│
├── server/                          # Node.js application source code
│   ├── src/
│   ├── test/
│   ├── package.json
│   ├── package-lock.json
│   ├── webpack.config.js
│   └── babel.config.js
│
├── terraform/                       # Infrastructure as Code (IaC)
│   │
│   ├── application-server/          # EC2 module for application deployment
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── output.tf
│   │   └── user_data.sh
│   │
│   ├── jenkins-server/              # Jenkins EC2 module (later removed)
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── output.tf
│   │   └── user_data.sh
│   │
│   ├── networking.tf                # VPC, Subnets, IGW
│   ├── iam.tf                       # IAM roles and policies
│   ├── main.tf                      # Main terraform config
│   ├── variables.tf                 # Input variables
│   ├── output.tf                    # Output values
│   └── terraform.tfvars             # Variable values
│
├── .github/
│   └── workflows/
│       └── ci-cd.yml                # GitHub Actions pipeline
│
├── Dockerfile                       # Production container
├── Dockerfile.test                  # Test container
├── .gitignore
└── README.md
```
---
**Infrastructure (Terraform)**
---
<img width="1797" height="762" alt="580042546-191e4e6d-ad44-4da9-a3ee-0e28997d9799" src="https://github.com/user-attachments/assets/05ecb817-0849-48b8-9d13-7f1cd8290471" />

---
<img width="1352" height="595" alt="3f0dcd84-3249-4d09-be2b-1daa56b7070c" src="https://github.com/user-attachments/assets/53d62fd7-e642-4f41-9935-26c91e58fd5c" />

---

🔹 Components Provisioned


- VPC (10.0.0.0/16)

- Public Subnet

- Internet Gateway

- Route Tables

- Security Groups
  
- EC2 Instances (App + Jenkins - deprecated)

- IAM Roles & Policies

- AWS ECR Repository

- S3 Bucket (optional backend)

- Security Considerations

- IAM roles used instead of hardcoded credentials

- Secrets managed via GitHub Secrets

- Restricted Security Group rules

- SSH access controlled

👉 Future Improvement: Replace SSH with AWS SSM Session Manager
---

**CI/CD Pipeline**

---

<img width="1326" height="617" alt="6df72f6b-ce6a-47f8-979b-0b6e742c9b9a" src="https://github.com/user-attachments/assets/a58fe913-06b2-491f-b15c-78f201fd227f" />
---

**🔹 Pipeline Workflow**

- Code pushed to GitHub

- GitHub Actions triggered

- Docker image built

- Image pushed to AWS ECR

- EC2 pulls latest image


---

  🐳 Docker Workflow

---

  <img width="1920" height="461" alt="580045214-744bfa51-c3f0-4972-bdcf-d1d93b97a918" src="https://github.com/user-attachments/assets/acc26dab-da68-41e3-a87e-ac1dc27a318b" />


```bash
docker build -t nodejs-web-app .

docker tag nodejs-web-app:latest <ECR_URL>

docker push <ECR_URL>
```

---

**Deployment on EC2**
---

<img width="1312" height="673" alt="931efa7f-6c8a-4061-9a7c-ef76864ae63d" src="https://github.com/user-attachments/assets/92402ab6-b29e-4193-b884-e1180b07f1c3" />

 
```bash
docker stop my-app || true

docker rm my-app || true


docker pull <ECR_URL>


docker run -d -p 8000:8000 --name my-app <ECR_URL>
```
---

**Slack Integration**
---

<img width="1342" height="616" alt="9eaba455-77f3-4f16-b078-c3031ae7c470" src="https://github.com/user-attachments/assets/9aaae8d6-fc6b-47e2-b5fb-08139b6d18bf" />

---

- Build Success Alerts

- Build Failure Alerts

- Deployment Notifications

---


  ## ⚙ Engineering Challenges & Debugging Insights

During the implementation of this CI/CD pipeline, several real-world issues were encountered. Each challenge helped improve practical understanding of cloud infrastructure, DevOps workflows, and debugging techniques.


---

### ❌ WSL Installation Issue

- *Issue:* Ubuntu (WSL) was not installing properly.
- *Error:*  
  Windows Subsystem for Linux has no installed distributions.
- *Cause:* PowerShell was not opened in Administrator mode.
- *Fix:* Opened PowerShell as Administrator and installed Ubuntu.

```bash
wsl --install -d Ubuntu
```

---

### ❌ sudo command not recognized

- *Issue:* sudo command was not working.
- *Error:*  
  sudo is not recognized as an internal command.
- *Cause:* Command was executed in Windows PowerShell instead of Linux terminal.
- *Fix:* Opened Ubuntu (WSL terminal) and ran the command again.

```bash
sudo apt update
sudo apt install nodejs npm -y
```

---

### ❌ Node.js project path issue

- *Issue:* Project directory was not found on the EC2 instance.
- *Error:*  
  No such file or directory.
- *Cause:* Incorrect folder path was used.
- *Fix:* Located the correct directory using ls command.

```bash
ls
cd project1/node-js-web-app
```

---

### ❌ Application not opening in browser

- *Issue:* Application was running but not accessible in browser.
- *Cause:* Required port was not allowed in EC2 Security Group.
- *Fix:* Added inbound rule to allow application port.

Allowed Ports:

- 22 → SSH access
- 3000 / 8000 → Application access

---

### ❌ GitHub Actions working directory issue

- *Issue:* Dependencies were not installing during CI pipeline execution.
- *Cause:* Incorrect working directory was specified in workflow file.
- *Fix:* Updated the correct working directory.

```bash
yaml
working-directory: ./server
```

---

### ❌ Jenkins performance issue on t3.micro

- *Issue:* Jenkins was slow and unstable on EC2 instance.
- *Cause:* t3.micro instance has limited memory (1GB RAM).
- *Fix:* Migrated from Jenkins to GitHub Actions.

Benefits of GitHub Actions:

- No server maintenance required
- Faster pipeline execution
- Better integration with GitHub
- Scalable CI/CD solution

---

### ❌ Terraform credentials configuration issue

- *Issue:* Terraform repeatedly asked for AWS credentials.
- *Cause:* AWS credentials were not configured properly.
- *Fix:* Configured credentials using environment variables.

```bash
export AWS_ACCESS_KEY_ID=XXXX
export AWS_SECRET_ACCESS_KEY=XXXX
```

---


## 🚀 Future Improvements

- Add Load Balancer for better traffic handling
- Implement Auto Scaling for high availability
- Enable HTTPS using SSL certificate
- Add monitoring using AWS CloudWatch
- Store Terraform state in S3 backend
- Add automated testing stage in CI/CD pipeline

---

## 🧠 Key Skills Demonstrated

- CI/CD pipeline development using GitHub Actions
- Infrastructure as Code using Terraform
- Docker containerization and deployment
- AWS EC2 and ECR configuration
- Debugging real-world DevOps issues
- Linux command line operations

 ---

 ## 👩‍💻 Author

*Kumkum Rajput*

DevOps & Cloud Learner

GitHub: https://github.com/kumkum-014

----
