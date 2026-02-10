# Call Booking Application - Microservices on AWS EKS

## 📖 Overview
A scalable, microservices-based call booking application deployed on **AWS Elastic Kubernetes Service (EKS)**. This project demonstrates a production-ready cloud-native architecture using **Terraform** for Infrastructure as Code (IaC) and **Kubernetes** for container orchestration.

The system allows users to book calls while providing administrators with a dashboard to manage bookings and schedules, all running in a highly available, distributed environment.

## 🚀 Key Features
*   **Microservices Architecture**: Decoupled services for User and Admin functionalities for independent scaling and development.
*   **Infrastructure as Code (IaC)**: Complete AWS infrastructure (VPC, EKS, IAM, Security Groups) provisioned via **Terraform**.
*   **Kubernetes Orchestration**: Managed via Amazon EKS with auto-scaling and self-healing capabilities.
*   **Advanced Routing**: **AWS Application Load Balancer (ALB)** Ingress Controller handles path-based routing (`/api/user`, `/api/admin`).
*   **Containerization**: Fully Dockerized services with images stored in **AWS ECR (Elastic Container Registry)**.
*   **Stateful Persistence**: Reliable MongoDB deployment within Kubernetes using StatefulSets and PersistentVolumes.
*   **Monitoring**: Integrated health checks and liveness probes for high availability.

## 🛠 Tech Stack

### Cloud & DevOps
*   **Cloud Provider**: AWS (EKS, VPC, ECR, IAM, Route53, ALB)
*   **IaC**: Terraform
*   **Orchestration**: Kubernetes, Helm
*   **CI/CD**: Docker, Git

### Backend
*   **Runtime**: Node.js
*   **Framework**: Express.js
*   **Database**: MongoDB

### Frontend
*   **Framework**: React.js
*   **Styling**: CSS Modules / Custom CSS

## 🏗 Architecture
![Architecture Diagram](https://user-images.githubusercontent.com/29688323/179655923-e5d9ed72-176e-4956-897c-c1bb434d5c63.jpg)

The application follows a clean microservices pattern:

1.  **Infrastructure Layer**: 
    *   Custom VPC with Public/Private subnets across multiple Availability Zones.
    *   EKS Cluster with managed Node Groups.
2.  **Application Layer**:
    *   **User Service**: Handles frontend UI and backend logic for booking calls.
    *   **Admin Service**: Handles frontend UI and backend logic for administrative tasks.
3.  **Data Layer**:
    *   MongoDB cluster accessible only within the internal network.
4.  **Networking**:
    *   ALB Ingress Controller routes traffic from the internet to internal Kubernetes services.

## 📂 Project Structure
```bash
├── terraform/          # Terraform configuration files for AWS Infrastructure
├── kubernetes/         # Kubernetes manifests (Deployments, Services, Ingress, ConfigMaps)
├── user-api/           # Backend Node.js service for User functionality
├── user-ui/            # Frontend React application for Users
├── admin-api/          # Backend Node.js service for Admin functionality
├── admin-ui/           # Frontend React application for Admins
└── docker-compose.yaml # Local development setup
```

## 🔧 Getting Started

### Prerequisites
*   AWS CLI configured
*   Terraform installed
*   Docker & Kubectl installed

### Deployment Steps

1.  **Provision Infrastructure**:
    Navigate to the terraform directory and apply the configuration.
    ```bash
    cd terraform
    terraform init
    terraform apply
    ```

2.  **Configure Kubernetes Access**:
    Update your local kubeconfig to communicate with the new cluster.
    ```bash
    aws eks update-kubeconfig --region us-east-1 --name call-booking-app-cluster
    ```

3.  **Deploy Microservices**:
    Use the provided script to deploy all services, secrets, and ingress rules.
    ```bash
    ./kubernetes/apply-all.sh
    ```

4.  **Access the Application**:
    Get the Load Balancer DNS to access the application.
    ```bash
    kubectl get ingress -n user
    ```

## 👨‍💻 Author
**Rishi Majmudar**  
*Cloud & DevOps Engineer*
