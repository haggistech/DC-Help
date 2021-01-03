pipeline {
    agent { label 'master' }
    triggers {
        cron("H 0 4 * *")
    }
    stages {
        stage('build') {
            steps {
                sh """
                   cd /home/haggis/.config/docker/
                   for i in */
                   do 
                   zip -0 -r "${i%}.zip" "$i" & done
                   wait
                   for f in \$(ls /home/haggis/.config/docker/*.zip)
                   do 
                     aws s3 cp \$f s3://mik-plex-backups/configbackups/
                   done
                   rm /home/haggis/.config/docker/*.zip
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

