pipeline {
    // agent {
    //     label 'docker'
    // }
    agent any

    environment {
        DOCKER_IMAGE = 'hikari141/medigpt'
        DOCKERFILE_PATH = './Dockerfile'
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
                    sh "docker build -t ${DOCKER_IMAGE} -f ${DOCKERFILE_PATH} ."
                    // docker.build(${DOCKER_IMAGE})
                    // Log into Docker registry
                    withCredentials([usernamePassword(
                        credentialsId: '943612a8-9556-45ad-b4d0-99732a213218',
                        usernameVariable: 'DOCKERHUB_USERNAME',
                        passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
                        }

                    // Push the Docker image
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
