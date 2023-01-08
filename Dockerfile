FROM tomee
COPY ./target/maven-web-application.war   /usr/local/tomee/webapps/

EXPOSE 8080
#command: ["/bin/sh","-c","/keycloak/deploy/entrypoint.sh"]
