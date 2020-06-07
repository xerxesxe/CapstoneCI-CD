pipeline {
<<<<<<< HEAD
   agent any
   environment {
       registry = "xerxesxe/bulletinboard"
       GOCACHE = "/tmp"
   }
   stages {
       stage('Build') {
           agent {
               docker {
                   image 'bulletinboard'
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
           }    
       }
       stage('Test') {
           agent {
               docker {
                   image 'bulletinboard'
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
               sh 'go test ./... -v -short'           
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
       stage ('Deploy') {
           steps {
               script{
                   def image_id = registry + ":$BUILD_NUMBER"
                   sh "ansible-playbook  playbook.yml --extra-vars \"image_id=${image_id}\""
               }
           }
       }
   }
}
=======
  agent any
  stages {
    stage('Build') {
      agent {
        docker {
          image 'capstone'
        }

      }
      steps {
        sh 'cd ${GOPATH}/src'
        sh 'mkdir -p ${GOPATH}/src/hello-world'
        sh 'cp -r ${WORKSPACE}/* ${GOPATH}/src/hello-world'
        sh 'go build'
      }
    }

    stage('Test') {
      agent {
        docker {
          image 'capstone'
        }

      }
      steps {
        sh 'cd ${GOPATH}/src'
        sh 'mkdir -p ${GOPATH}/src/hello-world'
        sh 'cp -r ${WORKSPACE}/* ${GOPATH}/src/hello-world'
        sh 'go clean -cache'
        sh 'go test ./... -v -short'
      }
    }

    stage('Publish') {
      environment {
        registryCredential = 'dockerhub'
      }
      steps {
        script {
          def appimage = docker.build registry + ":$BUILD_NUMBER"
          docker.withRegistry( '', registryCredential ) {
            appimage.push()
            appimage.push('latest')
          }
        }

      }
    }

    stage('Deploy') {
      steps {
        script {
          def image_id = registry + ":$BUILD_NUMBER"
          sh "ansible-playbook  playbook.yml --extra-vars \"image_id=${image_id}\""
        }

      }
    }

  }
  environment {
    registry = 'xerxesxe/bulletinboard'
    GOCACHE = '/tmp'
  }
}
>>>>>>> 376867478e3dd6ec782476cae566316dffb5f59f
