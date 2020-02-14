   
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
            
             docker.build("norah") 

            }
          }
        }

        stage('upload image'){
        steps {
   script{
            docker.withRegistry('https://147005956006.dkr.ecr.us-west-2.amazonaws.com' , 'ecr:us-west-2:eksuser')  {
              sh 'docker tag norah:latest 147005956006.dkr.ecr.us-west-2.amazonaws.com/norah:latest'
              sh 'docker push 147005956006.dkr.ecr.us-west-2.amazonaws.com/norah:latest'
            }
            }
              }
        }

stage('Set current context') {
			steps {
				withAWS(region:'us-east-1', credentials:'ecr_credentials') {
					sh '''
						kubectl config use-context arn:aws:eks:us-west-2:147005956006:cluster/capstonecluste
					'''
				}
			}
		}


stage('deploy to k8'){
steps{

    sh 'kubectl apply -f blue-deployment.yml'
}

}

    }
}