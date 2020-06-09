# This is my Udacity DevOps Capstone Project

This Project will Deploy a simple Golang App into an EKS Kubernetes Cluster. This will be done via a rolling CI/CD pipeline in Jenkins.

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

The Jenkinsfile contains 5 Stages
First Stage builds the App
Second Stage is for linting the Dockerfile
Third Stage is for Testing the App
Fourth Stage is for Publishing the new Image
Fifth Stage Deploys the latest Image to the EKS Cluster
