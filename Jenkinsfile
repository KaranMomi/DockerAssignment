pipeline {
    agent {
        label 'MASTER'
    }
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
                        args '-v $WORKSPACE:/demo -u root'
                        label 'MASTER'
                    }
                }
            steps {
                echo "Changing Directory"
                sh 'cd /demo'
                echo 'pwd'
                echo 'ls'
                sh 'sudo mvn clean install'
                echo 'Creating Artifacts..'
                archiveArtifacts artifacts: 'target/*.jar'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo "Creating image to run the java file"
                sh 'docker build -t runjar .'
            }
        }
        stage('Run Docker Container') {
            steps {
                echo "Running the container to see output of java file"
                sh 'docker run runjar'
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
