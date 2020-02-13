   
pipeline {
    
    agent any
    stages {
        stage('lint'){
            steps {
                sh 'tidy -q -e *.html' 
            }
        }
        stage('buid docker'){  
          steps{
            script{
            
             docker.build("norah/capstone") 

            }
          }
        }

        stage('upload image'){
        steps {
   script{
            docker.withRegistry('https://147005956006.dkr.ecr.us-west-2.amazonaws.com' , 'ecr:us-west-2:eksuser')  {
              sh 'docker tag norah/capstone:latest 147005956006.dkr.ecr.us-west-2.amazonaws.com/norah/capstone:latest'
              sh 'docker push 147005956006.dkr.ecr.us-west-2.amazonaws.com/norah/capstone:latest'
            }
            }
              }
        }
    }
}