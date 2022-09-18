pipeline {
  environment {
     dockerimagename = "vijaylokesh/my-tomcat"
    registry = "https://hub.docker.com/"
    registry_path = 'repository/docker/vijaylokesh/my-tomcat'
    registryCredential = 'my-docker-private-id'
    dockerImage = ''
    imageName = "skydevops"
    }
	tools{
        maven '3.8.6'
    }
  agent {
  label 'my-docker-slave'
  }
  stages {
    stage('Cloning Git') {
      steps {
        checkout scm
      }
	}
	
	stage ('Build Package') {

            steps {
               sh 'mvn clean package'
            }
        }
    stage('Building image') {
      steps{
        script {
         
         dockerImage = docker.build dockerimagename
        }
      }
    }
    stage('Pushing Image') {
      environment {
               registryCredential = 'my-docker-private-id'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }
	 stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "k8s-deployment-service.yaml", kubeconfigId: "kubernetes-deployment")
        }
      }
    }
	
  }
} 
