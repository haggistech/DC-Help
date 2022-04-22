pipeline {
    agent { label 'agent1' }
    triggers {
        cron('H 0 2 * *')
    }
    stages {
        stage('build') {
            steps {
                sh """
                   cd /home/haggis/docker
                   sudo docker-compose pull
                   sudo docker-compose up -d
                   """
            }
        }
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
    }
}
