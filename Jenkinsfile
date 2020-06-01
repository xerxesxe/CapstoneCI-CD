pipeline {
    agent any
    stages {
    stage('Checking environment') {
      echo 'Checking environment...'
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
    }
    stage("Linting") {
      echo 'Linting...'
      sh '/home/ubuntu/.local/bin/hadolint Dockerfile'
    }
    stage('Building image') {
	    echo 'Building Docker image...'
	     	sh "aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 994212878958.dkr.ecr.us-east-2.amazonaws.com"
	     	sh "docker build -t udacity_capstone ."
	     	sh "docker tag udacity_capstone:latest 994212878958.dkr.ecr.us-east-2.amazonaws.com/udacity_capstone:latest"
	     	sh "docker push 994212878958.dkr.ecr.us-east-2.amazonaws.com/udacity_capstone:latest"
      }
    stage('Deploying') {
      echo 'Deploying to AWS...'
            sh "aws eks --region us-east-2 update-kubeconfig --name capstone"
            sh "kubectl run udacity-project --image=994212878958.dkr.ecr.us-east-2.amazonaws.com/udacity_capstone:latest --requests=cpu=500m --expose --port=3000"
            sh "kubectl get deployments"
            sh "kubectl expose deployment udacity-project --type=LoadBalancer --name=udacity-capstone"
            sh "kubectl get services udacity-capstone"
      
      }
    
    stage("Cleaning up") {
      echo 'Cleaning up...'
      sh "docker system prune"
    }
  }
}