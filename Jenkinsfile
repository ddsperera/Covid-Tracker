node {
  printMessage("Pipeline start")

  stage('Clone repository') {
    checkout scm
  }

  
  stage('Build image') {
    app = docker.build("ddsperera/test-pipeline")
  }
  
    stage("Trigger unit tests") {
    sh 'python3 Tracker.py' 
  }
  
  stage('Push image') {
    docker.withRegistry('https://registry.hub.docker.com', 'Docker_Hub_Credentials') {
      app.push("latest")
    }
  }

  printMessage("Pipeline end")
}

def printMessage(message) {
  echo "${message}"
}
