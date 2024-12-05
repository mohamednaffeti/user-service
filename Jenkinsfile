pipeline {
    agent any
    environment {
        DOCKER_IMAGE_NAME = "user-service-image"
        CONTAINER_NAME = "user-service-container"
        APP_PORT = "8880"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/mohamednaffeti/user-service.git'
            }
        }
        stage('Build Project') {
            steps {
                script {
                    sh './mvnw clean package -DskipTests'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE_NAME} ."
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove any existing container
                    sh """
                    docker rm -f ${CONTAINER_NAME} || true
                    docker run -d --name ${CONTAINER_NAME} -p ${APP_PORT}:${APP_PORT} ${DOCKER_IMAGE_NAME}
                    """
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished!'
        }
        success {
            echo "Application is running on http://localhost:${APP_PORT}"
        }
        failure {
            echo 'Pipeline failed. Check logs for errors.'
        }
    }
}
