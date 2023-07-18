FROM maven:3.9.3-eclipse-temurin-8-alpine AS BUILD_IMAGE
#FROM openjdk AS BUILD_IMAGE
#RUN apt update && apt install maven -y
RUN mkdir -p /var/www/git-clone
WORKDIR /var/www/git-clone
#COPY CI-CD-Java-App-with-ECR-ECS/* . 
COPY pom.xml .
#RUN git remote add origin https://github.com/nidhi221697/CI-CD-Java-App-with-ECR-ECS.git
#RUN git clone https://github.com/nidhi221697/CI-CD-Java-App-with-ECR-ECS.git
#RUN cd CI-CD-Java-App-with-ECR-ECS/ && mvn install
#RUN mvn install package 
#RUN mvn install
#RUN mvn -B -s /usr/share/maven/ref/settings-docker.xml clean package
RUN mvn -f /var/www/git-clone/pom.xml clean package

FROM centos

MAINTAINER Nidhi

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

#WORKDIR /opt/tomcat/webapps
RUN rm -rf /opt/tomcat/webapps/*
COPY --from=BUILD_IMAGE  /var/www/git-clone/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
#RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]

#FROM tomcat:8.5.91-jre11-temurin-jammy
#RUN rm -rf /usr/local/tomcat/webapps/*
##copy build 
#COPY --from=BUILD_IMAGE  /var/www/git-clone/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
#EXPOSE 8080
#CMD ["tomcat.service", "run"]

