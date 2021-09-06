pipeline {
    agent {
        label 'MASTER'
    }
    stages {
        stage('Pulling Docker images') {
            steps {
                sh 'docker pull python:3.7-alpine'
            }
        }
        stage('Build and Artifact') {
            
            agent{
                  docker {
                        image 'python:3.7-alpine'
                        args '-v $WORKSPACE:/demo -u root'
                        label 'MASTER'
                    }
                }
            steps {
                echo "Changing Directory"
                sh 'cd /demo'
                echo 'pwd'
                echo 'ls'
                sh 'python hello.py'
                echo 'Creating Artifacts..'
                archiveArtifacts artifacts: '*.py'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo "Creating image to run the py file"
                sh 'docker build -t runpy .'
            }
        }
        stage('Run Docker Container') {
            steps {
                echo "Running the container to see output of py file"
                sh 'docker run runpy'
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
