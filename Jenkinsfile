pipeline{
    agent any
    stages {
        stage('Cleanup Workspace') {
            steps {
                cleanWs()
                sh """
                echo "Cleaned Up Workspace For Project"
                """
            }
        }

        stage('Code Checkout') {
            steps {
                sh """
                echo "Checkout code"
                """
            }
        }

        stage(' Unit Testing') {
            steps {
                sh """
                echo "Running Unit Tests"
                """
            }
        }

        stage('Code Analysis') {
            steps {
                sh """
                echo "Running Code Analysis"
                """
            }
        }

        stage('Code Deploy') {
            steps {
                sh """
                echo "Running Code Deploy"
                """
            }
        }
    }
    post {
        always {
            mail to: "painkiller.nhat@gmail.com",
            subject: "Build for ${BUILD_TAG}",
            body: "Result: ${currentBuild.currentResult}\nCommiter: ${currentBuild.changeSets}"
        }
    }
}   