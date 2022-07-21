pipeline{
    agent any
    
    environment {
		DOCKERHUB_CREDENTIALS=credentials('Docker_Hub_Credentials')
	}
    
    stages {
        stage('Clone Repository') {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'Git_Hub_Credentials', url: 'https://github.com/ddsperera/Covid-Tracker.git'
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
        
        		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push ddsperera/test-pipeline-1.0:latest'
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
