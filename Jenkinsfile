pipeline {
    agent any

    parameters {
        string(name: 'PORT', defaultValue: '8081', description: 'Port number to expose')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'gilabb', url: 'http://gitlab/Saeed/versioned-cowsay.git']])            }
        }

        stage('Run Docker Container') {
            steps {
                sh " sh init-cowsay.sh ${params.PORT}"
            }
        }

        stage('Test') {
            steps {
                script {
                    def status = sh(
                        script: """ sleep 5
                                    sh test.sh ${params.PORT}
                                """,
                        returnStatus: true
                    )
                    
                    if (status == 0) {
                        echo 'Cowsay web app check passed'
                    } else {
                        error 'Cowsay web app check failed'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'deploy ...'
            }
        }

    }

    post {
        always {
            // Cleanup stage
            
            script {
                // Run your script here
                sh  '''
                        # Kill all running containers
                        docker kill cowsay

                        # Delete stopped containers, volumes, and networks that are not used by containers
                        docker system prune -af
                    '''
            }
        }
    }

}
