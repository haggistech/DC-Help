pipeline {
    agent {
        label 'master || built-in'
    }
    triggers {
        cron('H 0 4 * *')
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }
    environment {
        archivefiles = "$JENKINS_HOME/jobs/DC-Help/branches/Docker-Config-Backups/builds/$BUILD_NUMBER/archive/"
    }
    stages {
        stage('Run backup script') {
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
                withAWS(credentials:'3c7a90de-23e1-49f1-91ec-41a4050a1207') {
                    sh 'aws s3 sync ${archivefiles} s3://mik-plex-backups/configbackups/'
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
