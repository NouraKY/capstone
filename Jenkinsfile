pipeline {
    agent any
    stages {
        stage('lint'){
            steps {
                sh 'tidy -q -e *.html' 
            }
        }
        stage('buid docker'){  
           app = docker.build("nalyahya/capstone")    
        }

        stage('upload image'){
        steps {
            
            sh '$(aws ecr get-login --no-include-email --region us-west-2)'
            sh 'sudo docker tag capstone:latest 147005956006.dkr.ecr.us-west-2.amazonaws.com/capstone:latest'
            sh 'sudo docker push 147005956006.dkr.ecr.us-west-2.amazonaws.com/norah:latest'
              }
        }
    }
}