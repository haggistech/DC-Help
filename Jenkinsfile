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
			withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: '3c7a90de-23e1-49f1-91ec-41a4050a1207', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        	sh 'sudo ./backup.sh'
			}
                    }
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
