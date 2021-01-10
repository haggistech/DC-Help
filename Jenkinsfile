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
                s3Upload(bucket:"mik-plex-backups", path:'/configbackups/', includePathPattern:'**/*.zip', workingDir:'/home/haggis/.config/docker')
            }
        }
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
    }
}
