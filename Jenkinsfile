pipeline{
    agent any
    stages {
        stage('Clone Repository') {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'Git_Hub_Credentials', url: 'https://github.com/devopshint/jenkins...
]]])

             
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                  sh 'docker build -t ddsperera/test-pipeline-1.0:latest .'
                }
            }
        }
        stage('Deploy Docker Image') {
            steps {
                script {
                 withCredentials([string(credentialsId: 'Docker_Hub_Credentials', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u ddsperera -p ${dockerhubpwd}'
                 }  
                 sh 'docker push ddsperera/test-pipeline-1.0:latestt'
                }
            }
        }
    
    stage('Deploy App on k8s') {
      steps {
            sshagent(['2d6c9874-b8ce-4263-91f9-3ec295712a6c']) {
            sh "scp -o StrictHostKeyChecking=no nodejsapp.yaml ubuntu@172.31.20.17:/home/ubuntu"
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
    }
}


