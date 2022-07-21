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
    
    stages{
      stage('login server'){
         steps{
            sshagent(credentials:['2d6c9874-b8ce-4263-91f9-3ec295712a6c']){
               sh 'ssh  -o StrictHostKeyChecking=no  root@172.31.20.17 uptime "whoami"'
          }
        echo "success lgoin"
         }
       }
   }
    
    stage("kubernetes deployment"){
  sh 'kubectl apply -f k8s-deployment.yml'
}
    
    
  }

  printMessage("Pipeline end")
}

def printMessage(message) {
  echo "${message}"
}
