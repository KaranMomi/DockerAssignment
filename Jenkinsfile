pipeline {
    agent any
    stages {
        stage('Pulling Docker images') {
            steps {
                sh 'docker pull maven:3.8.2-openjdk-11'
                sh 'docker pull openjdk:8-jdk-slim'
            }
        }
        stage('files path') {
            steps {
                echo 'files path'
            }
        }
        stage('final stage') {
            steps {
                echo 'done'
            }
        }
    }
    post {
    always {
        slackSend channel: 'test', message:"started ${currentBuild.fullDisplayName}" 
    }
    }
}
