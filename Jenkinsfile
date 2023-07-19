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
        stage('Build App Image') {
            steps {
                script {
                    #dockerImage = docker.build( appRegistry + ":$BUILD_NUMBER", "./Dockerfiles/App/")
                    sh "docker build -t public.ecr.aws/j1d7c5r7/nidhi_ecs_project:$BUILD_NUMBER ./Dockerfiles/App/ --no-cache"
                }
            }
        }
        
        stage('Upload App Image') {
          steps{
            script {
                sh "aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/j1d7c5r7"
                sh "docker push public.ecr.aws/j1d7c5r7/nidhi_ecs_project:$BUILD_NUMBER"
                //sh "docker push public.ecr.aws/j1d7c5r7/nidhi_ecs_project:latest"
                //ocker.withRegistry( awsRegistry, registryCredential ) {
                //dockerImage.push("$BUILD_NUMBER")
                //dockerImage.push('latest')
              //}
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
