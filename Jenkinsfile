pipeline {
     agent any
     stages {
        stage('Package') {
        steps{
            docker.build("nginxdemos/hello")
         }
    }

    stage('Scan') {
        steps{
            aquaMicroscanner imageName: 'nginxdemos/hello', notCompliesCmd: 'exit 4', onDisallowed: 'fail', outputFormat: 'html'
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