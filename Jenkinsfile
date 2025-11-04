pipeline {
    agent any
 
    tools {
        maven 'MAVEN_HOME' // same name as configured in Jenkins tools
    }
 
    stages {
        stage('Checkout') {
            steps {
                git branch: 'dayTwoJava', url: 'https://github.com/andrewkhmaladze/AndrewDevopsBootCamp.git'
            }
        }
 
        stage('Build') {
            steps {
                sh 'mvn clean compile -DskipTests'
            }
        }
 
        stage('Test') {
            steps {
                sh 'mvn test || true'  // <-- continue even if tests fail (for demo)
            }
            post {
                always {
                    junit '**/target/surefire-reports/*.xml'
                }
            }
        }
 
        stage('Checkstyle') {
            steps {
                script {
                    // Run Checkstyle and avoid breaking the build if it fails
                    sh 'mvn checkstyle:checkstyle || true'
 
                    // Check if the file exists before recording
                    if (fileExists('target/checkstyle-result.xml')) {
                        recordIssues tools: [checkStyle(pattern: '**/target/checkstyle-result.xml')]
                        echo '✅ Checkstyle report generated and recorded.'
                    } else {
                        echo '⚠️ No Checkstyle report found. Skipping recordIssues.'
                    }
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
            echo '✅ Pipeline finished successfully.'
        }
        failure {
            echo '❌ Pipeline failed. Check logs and reports.'
        }
        always {
            echo 'Pipeline completed (success or failure).'
        }
    }
}
