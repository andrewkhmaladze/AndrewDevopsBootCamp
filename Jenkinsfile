pipeline {
    agent any
    tools {
        maven 'MAVEN_HOME'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/andrewkhmaladze/AndrewDevopsBootCamp.git'
            }
        }
        stage('Build') {
            steps {
                sh 'echo "Compiling app..."'
                sh 'sleep 2'
            }
        }
        stage('Test') {
            steps {
                sh 'echo "Running tests..."'
                sh 'sleep 2'
                sh 'echo "Tests passed successfully!"'
            }
        }
        stage('Package') {
            steps {
                sh 'tar -czf build-artifact.tar.gz *'
                archiveArtifacts artifacts: 'build-artifact.tar.gz', fingerprint: true
            }
        }
        stage('Deploy (Simulated)') {
            steps {
                sh 'echo "Deploying to staging..."'
                sh 'sleep 2'
            }
        }
    }
    post {
        always {
            echo 'Pipeline completed!'
        }
    }
}       #coment to test, more from me  
