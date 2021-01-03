pipeline {
    agent { label 'master' }
    triggers {
        cron("H 0 4 * *")
    }
    stages {
        stage('build') {
            steps {
                timeout(time: 3, unit: 'MINUTES') {
                    retry(5) {
                    	sh 'sudo ./backup.sh'
                    }
                }
            }
        }
        stage('Archive') {
            dir('/home/haggis/.config/docker/') {
                archiveArtifacts artifacts: '**'
            }
        }
     	stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
    }
}
