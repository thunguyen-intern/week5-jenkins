pipeline {
    // agent {
    //     label 'docker'
    // }
    agent any

    environment {
        DOCKER_IMAGE = 'hikari141/medigpt'
        DOCKER_CREDENTIAL = credential('943612a8-9556-45ad-b4d0-99732a213218')
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
                    dockerImage = docker.build(${DOCKER_IMAGE} + ":v${BUILD_NUMBER}")
                    
                    // Log into Docker registry
                    sh "docker login -u ${DOCKER_CREDENTIAL_USR} -p ${DOCKER_CREDENTIAL_PSSWD}"
                    // Push the Docker image

                    dockerImage.push()
                    // sh "docker push ${DOCKER_IMAGE}"
                    // dockerImage = docker.build( appRegistry + ":$BUILD_NUMBER", "./Docker-files/app/multistage/")
                    // docker.withRegistry( vprofileRegistry, registryCredential ) {
                    //     dockerImage.push("$BUILD_NUMBER")
                    //     dockerImage.push('latest')
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
