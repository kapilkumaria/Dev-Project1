pipeline{
    agent any
    tools {
       terraform 'terraform'
    }
    
    node {
    checkout scm

    docker.withRegistry('https://registry.hub.docker.com', 'dockerHub') {

        def customImage = docker.build("kappu1512/dockerwebapp")

        /* Push the container to the custom Registry */
        customImage.push()
      }
    }

    stages{
        
         stage('Git Checkout'){
            steps{
                git branch: 'feature01', credentialsId: 'd65caf3a-ef40-43d3-b1a1-624e7dcc4ca4', url: 'https://github.com/kapilkumaria/Dev-Project1.git'
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


