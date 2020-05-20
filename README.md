### This is a Udacity DevOps Project

In this project, I will operationalize a Machine Learning Microservice API.
This project goal is to operationalize this working, machine learning microservice using kubernetes, which is an open-source system for automating the management of containerized applications. In this project I will:

Test the project code using linting
Complete a Dockerfile to containerize this application
Deploy a containerized application using Docker and make a prediction
Improve the log statements in the source code for this application
Configure Kubernetes and create a Kubernetes cluster
Deploy a container using Kubernetes and make a prediction
Upload a complete Github repo with CircleCI to indicate that the code has been tested

### Instructions
First Setup a python virtual environment and activate it
python3 -m venv ~/.devops
source ~/.devops/bin/activate

#Install the necessary dependencies
make install

#Run the Main app
1. Run in Docker:  `./run_docker.sh`
2. Run in Kubernetes:  `./run_kubernetes.sh`
3. Run the make_prediction.sh script
