pipeline {
    agent any
    stages {
        stage('lint'){
            steps {
                sh 'tidy -q -e *.html'
        
            }
        }
        stage('buid docker'){
           sh 'docker build --tag=capstone .'

        }

        stage('upload image'){
            sh '$(aws ecr get-login --no-include-email --region us-west-2)'
            sh 'docker tag capstone:latest 147005956006.dkr.ecr.us-west-2.amazonaws.com/capstone:latest'
            sh 'docker push 147005956006.dkr.ecr.us-west-2.amazonaws.com/norah:latest'
        }

    
    }
}