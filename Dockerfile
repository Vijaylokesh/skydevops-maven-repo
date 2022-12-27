FROM amazonlinux
WORKDIR /opt
RUN yum update -y && yum install git -y && amazon-linux-extras install java-openjdk11 && yum install maven -y
RUN yum install tree -y && git clone https://github.com/ElevenDevOps/test_maven_repo.git && cd test_maven_repo && mvn clean package && ls -lrt target

FROM tomee
COPY --from=0  /opt/test_maven_repo/target/maven-web-application.war /usr/local/tomee/webapps/

EXPOSE 8080
