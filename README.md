# Obelion Cloud Infrastructure and CI/CD Automation

This repository contains production-ready Infrastructure as Code (Terraform) and CI/CD automation using GitHub Actions for a secure, scalable 2-tier web application architecture on AWS.

## Table of Contents

- [Architecture Overview](#architecture-overview)
- [Infrastructure Components](#infrastructure-components)
- [Repository Structure](#repository-structure)
- [Prerequisites](#prerequisites)
- [Deployment Guide](#deployment-guide)
- [CI/CD Pipeline](#cicd-pipeline)
- [Security Configuration](#security-configuration)
- [Monitoring](#monitoring)
- [Application Details](#application-details)
- [Screenshots](#screenshots)

---

## Repository Structure


Repository Root
├── terraform/
│   ├── modules/
│   │   ├── networking/
│   │   │   ├── vpc/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   └── outputs.tf
│   │   │   ├── subnet/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   └── outputs.tf
│   │   │   ├── route-table/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   └── outputs.tf
│   │   │   └── nacl/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       └── outputs.tf
│   │   ├── security/
│   │   │   └── security_group/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       └── outputs.tf
│   │   ├── compute/
│   │   │   └── ec2/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       ├── outputs.tf
│   │   │       ├── backend-script.sh
│   │   │       └── docker-script.sh
│   │   ├── database/
│   │   │   └── rds/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       ├── outputs.tf
│   │   │       ├── parameter-group.tf
│   │   │       └── subnet-group.tf
│   │   └── monitoring/
│   │       └── cloudwatch/
│   │           ├── main.tf
│   │           ├── variables.tf
│   │           └── outputs.tf
│   └── environments/
│       ├── dev/
│       │   ├── main.tf
│       │   ├── provider.tf
│       │   ├── variables.tf
│       │   └── terraform.tfvars
│       ├── staging/
│       │   ├── main.tf
│       │   ├── provider.tf
│       │   ├── variables.tf
│       │   └── terraform.tfvars
│       └── prod/
│           ├── main.tf
│           ├── provider.tf
│           ├── variables.tf
│           └── terraform.tfvars
│
├── laravel-backend/
│   ├── .env.example
│   ├── app/
│   ├── public/
│   └── .github/
│       └── workflows/
│           └── deploy.yml
│
├── uptime-kuma-frontend/
│   ├── docker-compose.yml
│   └── .github/
│       └── workflows/
│           └── deploy.yml
│
└── README.md


Prerequisites

Terraform >= 1.0.0

AWS CLI configured

SSH key pair for EC2

Git



Infrastructure Components

Compute Resources
Component 	Type 	Specifications 	Subnet Type
Frontend 	EC2 t2.micro 	1 vCPU, 1GB RAM, 8GB EBS 	Public
Backend 	EC2 t2.micro 	1 vCPU, 1GB RAM, 8GB EBS 	Public
Database
Component 	Engine 	Version 	Storage 	Availability
RDS Instance 	MySQL 	8.0 	20GB gp2 	Multi-AZ
Networking

    VPC CIDR: 10.0.0.0/16
    Public Subnets: 10.0.1.0/24 (AZ-a), 10.0.2.0/24 (AZ-b)
    Private Subnets: 10.0.3.0/24 (AZ-a), 10.0.4.0/24 (AZ-b)
    Internet Gateway: Provides internet access for public subnets
    
Deployment Guide

Clone the repository:

git clone https://github.com/amrAdel-1/obelion.ai



Initialize Terraform:

terraform init


Plan and apply:

terraform plan
terraform apply


Note outputs:

Frontend-Public-IP = "<Frontend IP>"
Backend-Public-IP = "<Backend IP>"
RDS-Endpoint = "<RDS Endpoint>"

CI/CD Pipeline

Frontend workflow triggers on push to master

Backend workflow triggers on push to main

Uses GitHub Actions to SSH into EC2, pull latest code, and restart services

Required GitHub Secrets

HOST_DNS, USERNAME, SSH_PRIVATE_KEY

Backend: DB_HOST, DB_NAME, DB_USERNAME, DB_PASSWORD

Security Configuration

Network ACLs for public and private subnets

Security Groups for Frontend, Backend, Database

Database in private subnet, no direct internet

SSH keys and GitHub Secrets used for credentials

Monitoring

CloudWatch alarms for CPU usage

SNS notifications

Uptime Kuma monitors frontend and backend availability

Application Details
Frontend: Uptime Kuma

Node.js + Vue.js

HTTP/HTTPS monitoring

Status dashboard

Backend: Laravel API

PHP 8.3 + Laravel

RDS MySQL 8.0

RESTful API

Deployed via GitHub Actions

License

Provided as-is for Obelion Cloud challenge