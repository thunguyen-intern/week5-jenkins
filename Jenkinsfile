pipeline {
    // agent {
    //     label 'docker'
    // }
    agent any

    environment {
        DOCKER_IMAGE = 'hikari141/docker101tutorial'
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        dockerImage = ''
    }

    stages {
        stage('Cleanup Workspace') {
            steps {
                cleanWs()
                sh "echo 'Cleaned Up Workspace For Project'"
            }
        }

        stage('Checkout') {
            steps {
                checkout scm
                // Check out the code that contains the Dockerfile
                // Skip this step
                // Remind me later
                sh "echo 'Checkout'"
            }
        }

        stage(' Unit Testing') {
            steps {
                sh "echo 'Running Unit Tests'"
            }
        }

        stage('Code Analysis') {
            steps {
                sh "echo 'Running Code Analysis'"
            }
        }

        stage('Code Deploy') {
            steps {
                sh "echo 'Code Deploy'"
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE} ."
                    // Log into Docker registry
                    sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin"
                    // Push the Docker image
                    // dockerImage.push()
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        always {
            mail to: "interns4-novobi@outlook.com",
            subject: "Build for ${BUILD_TAG}",
            body: """
                Status: Success!
            """
        }
    }
}
