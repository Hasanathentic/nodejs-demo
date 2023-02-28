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
        stage('stop container') {
            steps{
                sh 'sudo docker rm $(sudo docker stop $(sudo docker ps -a | grep "hasan9494/nodeapp" | cut -d " " -f 1))'
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
                sh'docker run -d -t --name node-8 -p 8081:80 hasan9494/nodeapp'
            }
        } 
        
}
post {
        always {
             sh 'docker logout'
          }
     }
}
