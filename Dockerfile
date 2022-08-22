FROM tomee
ADD maven-web-application.war   /usr/local/tomee/webapps/

EXPOSE 8080
