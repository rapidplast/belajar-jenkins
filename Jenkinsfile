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
                withSonarQubeEnv('sonarqube') {
                    sh "sonar-scanner -Dsonar.projectKey=belajar-jenkins -Dsonar.sources=. -Dsonar.host.url=http://192.168.0.85:9001 -Dsonar.login=squ_e102487f7b721199ffa8029d071e1c16d613725c"
                }
            }
        }
    }
    post {
        failure {
            mail body: '''Dear All, 
            Please check the''' "${BUILD_URL}" "ASAP!!", cc: '', from: 'NoReplyJenkins', subject: "Job ${JOB_NAME} (${BUILD_NUMBER}) is FAILURE :(", to: 'hafid.rosianto@rapidplast.co.id'
        }
        success {
            mail body: '''Dear All, 
            The build is success on''' "${BUILD_URL}", cc: '', from: 'NoReplyJenkins', subject: "Job ${JOB_NAME} (${BUILD_NUMBER}) is SUCCESS :D", to: 'hafid.rosianto@rapidplast.co.id'
        }
    }
}


// stage ('Belajar Jenkins - Post build actions') {
// /*
// Please note this is a direct conversion of post-build actions. 
// It may not necessarily work/behave in the same way as post-build actions work.
// A logic review is suggested.
// */
// 		// Mailer notification
// 		step([$class: 'Mailer', notifyEveryUnstableBuild: true, recipients: 'hafid.rosianto@rapidplast.co.id', sendToIndividuals: true])
 
// }
// installationName: 