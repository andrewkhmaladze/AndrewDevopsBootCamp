pipeline {
    agent any
    tools {
        maven 'MAVEN_HOME'      // Configure this name in Manage Jenkins → Tools
    }
 
    stages {
        stage('Checkout') {
            steps {
                git branch: 'compresingExcerciseBranch', url: 'https://github.com/andrewkhmaladze/AndrewDevopsBootCamp.git'
            }
        }
 
        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }
 
        stage('Test') {
            steps {
                // Run tests, but don't stop the pipeline immediately if they fail
                sh 'mvn test || true'
            }
            post {
                always {
                    // Always collect JUnit results, even if mvn test failed
                    junit '**/target/surefire-reports/*.xml'
                }
            }
        }
 
        stage('Package') {
            steps {
                sh 'mvn package -DskipTests'
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }
 
    post {
        success {
            echo '✅ Build, test, and packaging completed successfully!'
        }
        failure {
            echo '❌ Build failed. Check the console output or test results.'
        }
    }
}
