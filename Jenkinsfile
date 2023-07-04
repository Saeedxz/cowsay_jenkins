pipeline {
    agent any
    triggers {
  GenericTrigger causeString: 'Generic Cause', regexpFilterExpression: '', regexpFilterText: '', token: 'test', tokenCredentialId: 'secret_github'
}

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'git@github.com:Saeedxz/cowsay_jenkins.git']])
            }
        }
        
        stage('Build') {
            steps {
                sh  '''
                    sh init-cowsay.sh 8081 
                    '''
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