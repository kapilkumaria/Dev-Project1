pipeline{

  environment {
    VERSION = "${BUILD_NUMBER}"
    PROJECT = 'nodeapp'
    IMAGE = "$PROJECT:$VERSION"
    ECRURL = 'https://931058976119.dkr.ecr.ca-central-1.amazonaws.com/my-nodeapp'
    ECRCRED = 'ecr:us-east-1:awscredentials'
    }


    agent any
    tools {
       terraform 'terraform'
    }
    
    stages{
        
         stage('Git Checkout'){
            steps{
                git branch: 'feature01', credentialsId: 'd65caf3a-ef40-43d3-b1a1-624e7dcc4ca4', url: 'https://github.com/kapilkumaria/Dev-Project1.git'
            }
        }
        

         stage('Building Docker Image') {
            steps{
              script {
                docker.build('$IMAGE')
              }
            }
          }

        stage('Push Image'){
         steps{
           script{
             docker.withRegistry(ECRURL, ECRCRED){
               docker.image(IMAGE).push()
               }
             }
           }
         }    
             

         stage('Terraform init'){
           steps {
             sh "pwd"
             dir('dev'){
             sh "pwd"
             sh 'terraform init'
          }
         }
        }
                
         stage('Terraform apply?'){
           environment {
                AWS_ACCESS_KEY_ID = credentials('KAPIL_ACCESS_KEY')
                AWS_SECRET_ACCESS_KEY = credentials('KAPIL_SECRET_KEY')
                AWS_SESSION_TOKEN = credentials('KAPIL_SESSION_TOKEN')
           }
           steps {
             sh "pwd"
             dir('dev'){
             sh "pwd"
             input "Continue?"
             sh 'terraform apply -auto-approve'  
          }
         }
        }

                  
         stage('Terraform destroy?'){
           environment {
                AWS_ACCESS_KEY_ID = credentials('KAPIL_ACCESS_KEY')
                AWS_SECRET_ACCESS_KEY = credentials('KAPIL_SECRET_KEY')
                AWS_SESSION_TOKEN = credentials('KAPIL_SESSION_TOKEN')
           }
           steps {
             sh "pwd"
             dir('dev'){
             sh "pwd"
             input "Continue?"
             sh 'terraform destroy -auto-approve'   
          }
         }
        }
    }
}


