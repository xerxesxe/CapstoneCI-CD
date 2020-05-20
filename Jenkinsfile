pipeline {
     agent any
     stages {
         stage('Build') {
             steps {
                 sh run_docker.sh
             }
         }
         stage('Security Scan') {
              steps { 
                 aquaMicroscanner imageName: 'nginxdemos/hello', notCompleted: 'exit 1', onDisallowed: 'fail'
              }
         }    
         stage('Upload to AWS') {
              steps {
                  withAWS(region:'us-west-2',credentials:'JenkinsCredentials') {
                  sh 'echo "Uploading content with AWS creds"'
                      s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'server.yml', bucket:'udagram-jonas')
                  }
              }
         }
     }
}