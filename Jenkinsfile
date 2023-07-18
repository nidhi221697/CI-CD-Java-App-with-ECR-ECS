def COLOR_MAP = [
    'SUCCESS': 'good', 
    'FAILURE': 'danger',
]
pipeline {
    agent any
    
    environment {
        registryCredential = 'ecr:ap-south-1:awscreds'
       // appRegistry = '334671708617.dkr.ecr.us-east-1.amazonaws.com/ecr'
         appRegistry = 'public.ecr.aws/j1d7c5r7/nidhi_ecs_project'
         awsRegistry = "https://public.ecr.aws/j1d7c5r7/nidhi_ecs_project"
       // awsRegistry = "https://334671708617.dkr.ecr.us-east-1.amazonaws.com"
        cluster = "Stage"
        service = "service-stage"
    }
stages {
        /**stage('mvn package') {
            steps {
                script {
                    sh "rm -rf CI-CD-Java-App-with-ECR-ECS"
                   // sh "git clone https://github.com/nidhi221697/CI-CD-Java-App-with-ECR-ECS.git"
                    //sh "copy pom.xml /Dockerfiles/app/"
                    sh 'ls -al'
                    sh pwd
                    sh "mvn clean package"
                    //dockerImage = docker.build( appRegistry + ":$BUILD_NUMBER", "./Dockerfiles/App/")
                    dockerImage = docker.build( appRegistry + ":$BUILD_NUMBER", ".")
                }
            }
        }**/
        stage('Build App Image') {
            steps {
                script {
                    dockerImage = docker.build( appRegistry + ":$BUILD_NUMBER", "./Dockerfiles/App/")
                }
            }
        }
        
        stage('Upload App Image') {
          steps{
            script {
              docker.withRegistry( awsRegistry, registryCredential ) {
                dockerImage.push("$BUILD_NUMBER")
                dockerImage.push('latest')
              }
            }
          }
        }
        
         stage('Deploy to ECS staging') {
             steps {
                 withAWS(credentials: 'awscreds', region: 'ap-south-1') {
                     sh 'aws ecs update-service --cluster ${cluster} --service ${service} --force-new-deployment'
                 } 
             }
         }
        
    }
}
