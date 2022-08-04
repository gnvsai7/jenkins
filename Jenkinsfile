pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS=credentials('ghcr.io')
    }

    stages { 
        stage('SCM Checkout') {
            steps {
                git 'https://github.com/gnvsai7/jenkins.git'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login ghcr.io -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'sudo docker build -t ghcr.io/$DOCKERHUB_CREDENTIALS_USR/react-jenkins:latest .'
            }
        }

        stage('Docker push') {
            steps {
                sh 'sudo docker push ghcr.io/$DOCKERHUB_CREDENTIALS_USR/react-jenkins:latest'
            }
        }
        stage ('Deploy Ec2') {
            steps {
                sshagent(['ec2Login']) {
                    sh "ssh -o StrictHostKeyChecking=no ubuntu@ec2-18-220-174-254.us-east-2.compute.amazonaws.com ; docker pull ghcr.io/$DOCKERHUB_CREDENTIALS_USR/react-jenkins:latest"
                    sh "docker run -d -p 3000:3000 --name=react ghcr.io/$DOCKERHUB_CREDENTIALS_USR/react-jenkins:latest"
                }
            }
        }
    }
}