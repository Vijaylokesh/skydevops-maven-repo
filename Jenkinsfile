pipeline {
  environment {
    dockerimagename = "elevendevops/myelevendevopsimage"
    registry = "https://hub.docker.com/"
    registryCredential = 'my-docker-private-id'
    dockerImage = ""	  
	  
    }
	tools{
        maven 'maven3.8.6'
    }
  agent {
  label 'jenkins-slave'
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
