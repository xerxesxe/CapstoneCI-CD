pipeline {
   agent any
   environment {
       registry = "xerxesxe/k8scicd"
       GOCACHE = "/tmp"
   }
   stages {
       stage('Build') {
           agent {
               docker {
                   image 'golang'
               }
           }
           steps {
               // Create our project directory.
               sh 'cd ${GOPATH}/src'
               sh 'mkdir -p ${GOPATH}/src/hello-world'
               // Copy all files in our Jenkins workspace to our project directory.               
               sh 'cp -r ${WORKSPACE}/* ${GOPATH}/src/hello-world'
               
               // Build the app.
               sh 'go build'
               sh "docker run -p 8000:80 golang" 

           }    
        }
        stage ("lint dockerfile") {
            agent {
                docker {
                    image 'hadolint/hadolint:latest-debian' //'hadolint/hadolint:latest-debian'
            }
        }
        steps {

            sh 'hadolint Dockerfile | tee -a hadolint_lint.txt'
        }
        post {
            always {
                archiveArtifacts 'hadolint_lint.txt'
            }
        }
       }
       stage('Test') {
           agent {
               docker {
                   image 'golang'
               }
           }
           steps {                
               // Create our project directory.
               sh 'cd ${GOPATH}/src'
               sh 'mkdir -p ${GOPATH}/src/hello-world'
               // Copy all files in our Jenkins workspace to our project directory.               
               sh 'cp -r ${WORKSPACE}/* ${GOPATH}/src/hello-world'
               // Remove cached test results.
               sh 'go clean -cache'
               // Run Unit Tests.
               
               //sh 'go test ./... -v -short'           
           }
       }

       stage('Publish') {
           environment {
               registryCredential = 'dockerhub'
           }
           steps{
               script {
                   def appimage = docker.build registry + ":$BUILD_NUMBER"
                   docker.withRegistry( '', registryCredential ) {
                       appimage.push()
                       appimage.push('latest')
                   }
               }
           }
       }
       stage ('Deploy Blue') {
           steps {
               script{
                   def image_id = registry + ":$BUILD_NUMBER"
                    sh "aws eks --region us-east-2 update-kubeconfig --name capstone"
                    sh "kubectl config use-context arn:aws:eks:us-east-2:994212878958:cluster/capstone"
                    sh "kubectl apply -f ./blue-controller.json"
                    sh "kubectl apply -f ./blue-service.json"
                   
               }
           }
       }
       stage ('Deploy Green') {
           steps {
               script{
                   def image_id = registry + ":$BUILD_NUMBER"
                    sh "aws eks --region us-east-2 update-kubeconfig --name capstone2"
                    sh "kubectl config use-context arn:aws:eks:us-east-2:994212878958:cluster/capstone2"
                    sh "kubectl apply -f ./green-controller.json"
                    sh "kubectl apply -f ./green-service.json"
                    
               }
           }
       }
   }
}
