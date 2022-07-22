node {
  printMessage("Pipeline start")

  stage('Clone repository') {
    checkout scm
  }

  
  stage('Build image') {
    app = docker.build("ddsperera/test-pipeline")
  }
  
  stage("run") {
        sh """
          docker run --rm ddsperera/test-pipeline
        """
      }
    
  
  stage('Push image') {
    docker.withRegistry('https://registry.hub.docker.com', 'DockerHub_Credentials') {
      app.push("latest")
    }
  }

  printMessage("Pipeline end")
}

def printMessage(message) {
  echo "${message}"
}
