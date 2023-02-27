pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('ubuntu')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/Hasanathentic/nodejs-demo.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t hasan9494/nodeapp:latest .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push hasan9494/nodeapp:latest'
            }
        }
        stage('run image') {
            steps{
                sh 'docker run -t -d name hasan9494/nodeapp:latest -p 8080:8080'
            }
        }   
}
post {
        always {
             sh 'docker logout'
          }
     }
}
