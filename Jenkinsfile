pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS=credentials('dockerHub')
    }

    stages { 
        stage('SCM Checkout') {
            steps {
                git 'https://github.com/gnvsai7/jenkins.git'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'sudo docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
                sh 'sudo docker build -t $DOCKERHUB_CREDENTIALS_USR/react-jenkins:latest .'
            }
        }

        stage('Docker push') {
            steps {
                sh 'sudo docker push $DOCKERHUB_CREDENTIALS_USR/react-jenkins:latest'
            }
        }
    }
}