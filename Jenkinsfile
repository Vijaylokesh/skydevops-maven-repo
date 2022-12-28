pipeline {
  environment {
    dockerimagename = "vijaylokesh/my-tomcat"
    registry = "https://hub.docker.com/"
    registryCredential = 'my-docker-private-id'
    dockerImage = ""	  
	  
    }
    tools {
        maven '3.8.6'
    }
	
  agent {
      label 'CI-Jenkins-Slave'
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
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("${env.BUILD_NUMBER}")
            dockerImage.push("latest")
          }
        }
      }
    }
	 
	
  }
} 
