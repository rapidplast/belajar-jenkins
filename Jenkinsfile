pipeline {
    agent any
    stages {
        stage ('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'd16b712d-e5f4-41b9-ad6d-1517229e2b1c', url: 'https://github.com/rapidplast/belajar-jenkins.git'
            } 
        }
        stage ('Build') {
            steps {
                sh 'cd /var/lib/docker/volumes/belajar-jenkins/_data/ && git pull'  
            }
        }
        stage ('Test') {
            steps {
                withSonarQubeEnv(installationName: 'sonarqube') {
                    sh 'clean sonar:sonar'
                }
            }
        }
    }
}


stage ('Belajar Jenkins - Post build actions') {
/*
Please note this is a direct conversion of post-build actions. 
It may not necessarily work/behave in the same way as post-build actions work.
A logic review is suggested.
*/
		// Mailer notification
		step([$class: 'Mailer', notifyEveryUnstableBuild: true, recipients: 'hafid.rosianto@rapidplast.co.id', sendToIndividuals: true])
 
}