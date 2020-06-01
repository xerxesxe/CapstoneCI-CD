pipeline {
     agent any
     stages {
         stage('Build') {
             steps {
                  sh "aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 994212878958.dkr.ecr.us-east-2.amazonaws.com"
                  sh "docker build -t udacity_capstone ."
                  sh "docker tag udacity_capstone:latest 994212878958.dkr.ecr.us-east-2.amazonaws.com/udacity_capstone:latest"
                  sh "docker push 994212878958.dkr.ecr.us-east-2.amazonaws.com/udacity_capstone:latest"
             }
         }
         stage('Lint') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }      
         stage('Upload to AWS') {
              steps {
                  withAWS(region:'us-west-2',credentials:'JenkinsCredentials') {
                  sh 'echo "deploying with AWS creds"'
                  sh "aws eks --region us-east-2 update-kubeconfig --name capstone"
                  sh "kubectl run udacity-project --image=994212878958.dkr.ecr.us-east-2.amazonaws.com/udacity_capstone:latest --requests=cpu=500m --expose --port=3000"
                  sh "kubectl get deployments"
                  sh "kubectl expose deployment udacity-project --type=LoadBalancer --name=udacity-capstone"
                  sh "kubectl get services udacity-capstone"
                  }
              }
         }
     }
}