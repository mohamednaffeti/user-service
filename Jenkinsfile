pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/mohamednaffeti/user-service.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t user-service-image .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    sh '''
                    docker run -d --name user-service-container -p 8080:8080 user-service-image
                    '''
                }
            }
        }
    }
}
