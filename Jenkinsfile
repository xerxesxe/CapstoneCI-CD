pipeline {
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