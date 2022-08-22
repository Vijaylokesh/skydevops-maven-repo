pipeline {
    agent any
    tools{
        maven 'maven3.8.6'
    }
    stages {
        stage ('Checkout SCM') {

            steps {
               checkout scm
            }
        }

        stage ('Build') {

            steps {
               sh 'mvn clean package'
            }
        }
        
        stage ('deploy') {

            steps {
               sh """
               docker build -t tomcat_custom_img:v1 .
               docker run --name tomcat_container1 -p 5050:8080 -d tomcat_custom_img:v1
               """
                    
                }
        }

        
       }
}
