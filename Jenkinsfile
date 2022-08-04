pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS=credential('dockerHub')
    }

    stages { 
        stage('SCM Checkout') {
            steps {
                git 'https://github.com/gnvsai7/react-assignment-1.git'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker build -t $DOCKERHUB_CREDENTIALS_USR/react-jenkins:latest .'
            }
        }

        stage('Docker push') {
            steps {
                sh 'docker push $DOCKERHUB_CREDENTIALS_USR/react-jenkins:latest'
            }
        }
    }
}