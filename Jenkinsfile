pipeline {
    agent { label 'master' }
    triggers {
        cron("H 0 4 * *")
    }
    stages {
        stage('build') {
            steps {
                timeout(time: 3, unit: 'MINUTES') {
                    retry(2) {
                    	sh 'sudo ./backup.sh'
                    }
                }
            }
        }
        stage('Archive') {
            steps {
                 dir('/home/haggis/.config/docker/') {
                     archiveArtifacts artifacts: '*.zip'
                 }
            }
        }
     	stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
    }
}
