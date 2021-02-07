pipeline{

  agent 
  { 
    label 'master'
  }


  environment {
    VERSION = "${BUILD_NUMBER}"
    PROJECT = 'nodeapp'
    IMAGE = "$PROJECT:$VERSION"
    ECRURL = 'https://931058976119.dkr.ecr.us-east-1.amazonaws.com/my-nodeapp'
    ECRCRED = 'ecr:us-east-1:awscredentials'
    }


    tools {
       terraform 'terraform'
    }
    
    stages{
        
         stage('Git Checkout'){
            steps{
                git branch: 'feature01', credentialsId: 'd65caf3a-ef40-43d3-b1a1-624e7dcc4ca4', url: 'https://github.com/kapilkumaria/terraformtroubleshooting.git'
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
           environment{
             AWS_ACCESS_KEY_ID = credentials('17437a28-ca2b-4fff-a6a0-dd7b0978a20d')
             AWS_SECRET_ACCESS_KEY = credentials('17437a28-ca2b-4fff-a6a0-dd7b0978a20d')
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
           environment{
             AWS_ACCESS_KEY_ID = credentials('17437a28-ca2b-4fff-a6a0-dd7b0978a20d')
             AWS_SECRET_ACCESS_KEY = credentials('17437a28-ca2b-4fff-a6a0-dd7b0978a20d')
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


