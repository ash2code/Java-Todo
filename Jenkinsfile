pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your source code from GitHub
                git branch: 'main', url: 'https://github.com/ash2code/Java-Todo.git'
            }
        }

        stage('Build') {
            steps {
                // Build your project
                // For example:
                // sh 'mvn clean package'
                sh 'echo "Building the project..."'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                // Run SonarQube scanner using the existing SonarQube Docker container
                sh 'docker exec sqube sonar-scanner -Dsonar.host.url=http://100.24.61.233:9000 -Dsonar.login=sqa_186305e11cf53303e683d34fb8d1263d4fb9293a -Dsonar.projectKey=my_project_key'
            }
        }
    }

    post {
        always {
            // Cleanup Docker images after the pipeline execution
            // For example:
            // docker.image('sonarqube').remove()
            sh 'echo "Cleaning up..."'
        }
    }
}
