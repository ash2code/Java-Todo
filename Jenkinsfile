pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ash2code/Java-Todo.git'
            }
        }

        stage('Build') {
            steps {
                sh '''
                    mvn clean package
                '''
            }
        }

        stage('SonarQube Analysis') {
            steps {
                // Use the existing SonarQube container
                sh '''
                    mvn clean verify sonar:sonar \
                   -Dsonar.projectKey=hello-java \
                   -Dsonar.projectName='hello-java' \
                   -Dsonar.host.url=http://44.204.148.6:9000 \
                   -Dsonar.token=sqp_d3d08fe0a3082fd586ff13b276b0cb2dd592e5ed
                '''
            }
        }
    }
}


       
