pipeline{
    agent any
    stages {
      stage('Clone repository') {
        steps{
        checkout scm
       }
      }

  
  stage('Build image') {
    steps{
    app = docker.build("ddsperera/test-pipeline")
    }
  }
    
  
    stage("Trigger unit tests") {
      steps{
    sh 'python3 Tracker.py' 
     }
    }
  
  stage('Push image') {
    steps{
    docker.withRegistry('https://registry.hub.docker.com', 'Docker_Hub_Credentials') {
      app.push("latest")
    }
   }
  }
  
     stage('Deploy App on k8s') {
      steps {
            sshagent(['2d6c9874-b8ce-4263-91f9-3ec295712a6c']) {
            sh "scp -o StrictHostKeyChecking=no Deployment.yaml ubuntu@172.31.20.17:/home/ubuntu"
            script {
                try{
                    sh "ssh ubuntu@172.31.20.17 kubectl create -f ."
                }catch(error){
                    sh "ssh ubuntu@172.31.20.17 kubectl create -f ."
            }
}
        }
      
    }
    }

  printMessage("Pipeline end")
}

def printMessage(message) {
  echo "${message}"
}

}
