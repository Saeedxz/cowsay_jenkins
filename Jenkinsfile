pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'git@github.com:Saeedxz/cowsay_jenkins.git']])
            }
        }
        
        stage('Build') {
            steps {
                echo 'Running tests...'
            }
        }
        
        stage('Test') {
            steps {
                // Run tests for your application
                // Example: mvn test
                echo 'Running tests...'
            }
        }
        
        stage('Deploy') {
            steps {
                // Deploy your application to a target environment
                // Example: deploy to production
                echo 'Deploying the application...'
            }
        }
    }
}