pipeline {
    agent {
            label 'CD-Jenkins-Slave'
            }
    environment {
    dockerimagename = "vijaylokesh/my-tomcat:latest"
    registry = "https://hub.docker.com/"
    registryCredential = 'my-docker-private-id'
    dockerImage = ""	  
	  
    }    

    stages {
        stage ('Checkout SCM') {

            steps {
               checkout scm
            }
        }


     // Stopping Docker containers for cleaner Docker run
    stage('stop previous containers') {
         steps {
            
            sh 'docker ps -f name=vijaylokesh/my-tomcat -q | xargs --no-run-if-empty docker container stop'
            sh 'docker container ls -a -fname=vijaylokesh/my-tomcat -q | xargs -r docker container rm'
         }
       }
      
    stage('Docker Run') {
       steps{
          
          script {
         
           docker.withRegistry( 'http://'+registry, registryCredentials ) {
           image = docker.image(dockerimagename)
           image.pull()
         
           sh 'docker run -d -p 80:80 --rm --name vijaylokesh/my-tomcat ' + registry + dockerimagename
           }
         }  

         }
      }  
    
    }
  }


