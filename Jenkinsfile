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
        stage('Upload to S3') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: '3c7a90de-23e1-49f1-91ec-41a4050a1207', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh 'aws s3 ls'
                    sh 'aws s3 cp /home/haggis/.config/docker/* --exclude="*" --include="*.zip" s3://mik-plex-backups/configbackups/'
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
