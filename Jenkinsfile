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

        stage('Run Tests') {
            steps {
                catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
                    sh 'mvn test'
                }
            }
        }

        stage('Publish Results') {
            steps {
                junit '**/target/surefire-reports/*.xml'
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
