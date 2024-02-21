pipeline {
    agent any 

    stages {
        stage("Checkout") {
            steps {
                git branch: 'master', 
                url: 'https://github.com/ash2code/Todolist.git'
            }
        }
        stage("Build") {
            steps {
                sh "mvn clean install"
            }
        }
        stage("Test") {
            steps {
                sh "mvn test"
            }
        }
        stage("Package") {
            steps {
                sh "mvn package"
            }
        }
        stage('SonarQube analysis') {
            steps {
                script {
                    docker.image('sonarqube:latest').inside {
                        sh "/opt/sonar-scanner/bin/sonar-scanner -Dsonar.projectKey=squ_4b6af670fa704f908b602b0e00d8848a428fb779"
                    }
                }
            }
        }
    }
}
