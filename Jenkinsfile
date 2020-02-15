   
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



stage('Deploying to EKS') {
            steps {
                    withAWS(credentials: 'eksuser', region: 'us-west-2') {
                            sh ' aws --version'
                            sh ' pip3 install awscli --upgrade'
                            sh ' aws --version'
                            sh "aws eks --region us-west-2 update-kubeconfig --name capstonecluster"
                            sh 'kubectl apply -f blue-deployment.yml'
                            sh ' kubectl apply -f b-service.yml'
                        }


            }
        }

        stage('Add Service') {
            steps {
                    withAWS(credentials: 'eksuser', region: 'us-west-2') {
                            echo "appying service"
                            sh ' kubectl apply -f b-service.yml'
                        }


            }
        }

    }
}