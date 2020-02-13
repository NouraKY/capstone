   
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
            
             docker.build("capstone") 

            }
          }
        }

        stage('upload image'){
        steps {
   script{
            docker.withRegistry('https://147005956006.dkr.ecr.us-west-2.amazonaws.com' , 'eksuser')  {
              sh 'sudo docker tag capstone:latest 147005956006.dkr.ecr.us-west-2.amazonaws.com/norah/capstone:latest'
              sh 'sudo docker push 147005956006.dkr.ecr.us-west-2.amazonaws.com/norah/capstone:latest'
            }
            }
              }
        }
    }
}