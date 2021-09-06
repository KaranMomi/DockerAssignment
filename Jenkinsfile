pipeline {
    agent any
    stages {
        stage('Pulling Docker images') {
            steps {
                sh 'docker pull maven:3.8.2-openjdk-11'
                sh 'docker pull openjdk:8-jdk-slim'
            }
        }
        stage('Build and Artifact') {
            
            agent{
                  docker {
                        image 'maven:3.8.2-openjdk-11'
                        args '-v $WORKSPACE:/shared-volume -u root'
                        label 'CENTOS_SLAVE'
                    }
                }
            steps {
                echo "Changing Directory"
                sh 'cd /shared-volume'
                sh 'ls'
                echo "Running mvn install on the code"
                echo 'pwd'
                echo 'ls'
                sh 'mvn clean install'
                echo 'Creating Artifacts..'
                archiveArtifacts artifacts: 'target/*.jar'
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
