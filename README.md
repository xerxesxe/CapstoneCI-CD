# This is my Udacity DevOps Capstone Project

This Project will Deploy a simple ngingx into an EKS Kubernetes Cluster. This will be done via a blue/green CI/CD pipeline in Jenkins.

## Instructions

### Install the necessary dependencies

1. Create VPC Infrastructure with the infra.yaml file and teh Parameters.json file in cloudformation
2. Create an EKS Cluster either by using the create_eks.sh script or the eks_config.yaml with cloudformation

### Configure Jenkins

1. Install Jenkins
2. Set Docker-Hub Credentials and Github Credentials
3. Install Docker
4. Configure Pipeline in Jenkins

### Jenkinsfile

The Jenkinsfile contains 6 Stages

1. Stage builds the App
2. Stage is for linting the Dockerfile
3. Stage is for Testing the App
4. Stage is for Publishing the new Image
5. Stage Deploys the Image into Cluster 1, changes the ELB to blue Image
6. Stage Stage Deploys the Image into Cluster 2, changes the ELB to green Image
