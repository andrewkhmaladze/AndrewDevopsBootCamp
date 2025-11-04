pipeline {
    agent any
    tools {
        maven 'MAVEN_HOME'
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
 
        stage('Linter Check (Checkstyle)') {
            steps {
                // Run the Checkstyle plugin
                sh 'mvn checkstyle:checkstyle'
            }
            post {
                always {
                    recordIssues tools: [checkStyle(pattern: '**/target/checkstyle-result.xml')]
                }
                unstable {
                    echo '⚠️ Linter found warnings.'
                }
                failure {
                    echo '❌ Build failed due to style violations.'
                }
            }
        }
	
	stage('Auto Format (Optional)') {
    steps {
        sh 'mvn spotless:apply'
        echo '🧹 Code formatting automatically fixed by Jenkins.'
    }
} 
        stage('Formatter Check (Spotless)') {
            steps {
                // Verify formatting consistency (does NOT change code)
                sh 'mvn spotless:check'
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
            echo '✅ Build, lint, and format checks passed!'
        }
        failure {
            echo '❌ Code style or format issues detected.'
        }
    }
}
