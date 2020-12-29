pipeline {
    agent { label 'master' }
    triggers {
        cron("H 0 2 * * *")
    }
    stages {
        stage('build') {
            steps {
                sh "cd /home/haggis/docker"
                sh "sudo docker-compose pull"
                sh "sudo docker-compose up -d"
            }
        }
    }
}
