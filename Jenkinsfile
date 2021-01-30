pipeline{

  environment {
    imagename           = "kappu1512/node-app"
    registryCredential  = 'dockerHub'
    dockerImage         = ''
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
                dockerImage = docker.build imagename
              }
            }
          }

         stage('Push Image to DockerHub') {
            steps{
              script {
                 docker.withRegistry( '', dockerHub ) {
                 dockerImage.push("$BUILD_NUMBER")
                 dockerImage.push('latest')
                }
              }
            }
          }

         stage('Remove Unused docker image') {
           steps{
             sh "docker rmi $imagename:$BUILD_NUMBER"
             sh "docker rmi $imagename:latest"
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


