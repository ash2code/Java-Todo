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
                // Build your Java project using Maven commands
                sh '''
                    mvn clean package
                    # Add other build commands as needed
                '''
            }
        }

        stage('SonarQube Analysis') {
            steps {
                // Use the existing SonarQube container
                sh '''
                    docker exec sqube sonar-scanner \
                        -Dsonar.host.url=http://localhost:9000 \
                        -Dsonar.login=$SONAR_USER \
                        -Dsonar.password=$SONAR_PASSWORD \
                        -Dsonar.projectKey=java_todo_project \
                        -Dsonar.projectName=Java Todo Application \
                        # Add other SonarQube properties as needed
                '''
            }
        }

        stage('Post-Actions') {
            post {
                always {
                    // Cleanup tasks (e.g., remove temporary files, docker images)
                    sh 'echo "Cleaning up..."'
                }
            }
        }
    }
}
