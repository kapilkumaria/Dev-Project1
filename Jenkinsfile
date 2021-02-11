pipeline{

  agent 
  { 
    label 'ubuntu'
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
                git branch: 'feature01', credentialsId: 'd65caf3a-ef40-43d3-b1a1-624e7dcc4ca4', url: 'https://github.com/kapilkumaria/Dev-Project1.git'
            }
        }

        stage('Image Build'){
          steps{
            script{
              docker.build('$IMAGE')
            }
          }
        }


       stage('Docker Permissions'){

           steps {
             sh "pwd"
             dir('dev'){
             sh "sudo apt install openjdk-8-jdk -y"
             sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 931058976119.dkr.ecr.us-east-1.amazonaws.com"
             sh "docker build -t my-nodeapp ."
             sh "docker tag my-nodeapp:latest 931058976119.dkr.ecr.us-east-1.amazonaws.com/my-nodeapp:latest"
             sh "docker push 931058976119.dkr.ecr.us-east-1.amazonaws.com/my-nodeapp:latest"
             
          }
         }
        }




        
        stage('Push Image'){
          steps{
            script{
              docker.withRegistry(ECRURL, ECRCRED)
              {
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


