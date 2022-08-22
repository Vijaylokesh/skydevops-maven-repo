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
               sh "scp target/maven-web-application.war  ec2-user@54.158.8.136:/opt/tomcat9/webapps/"
                    
                }
        }

        
       }
}
