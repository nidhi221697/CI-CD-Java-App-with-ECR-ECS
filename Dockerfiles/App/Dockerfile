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

#FROM tomcat:8.5.91-jre11-temurin-jammy
#FROM tomcat:8.5.91-jdk21-openjdk-slim
FROM tomcat:10.1.11-jre17-temurin-jammy
#RUN rm -rf /usr/local/tomcat/webapps/*
#copy build 
COPY --from=BUILD_IMAGE  /var/www/git-clone/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
#CMD ["java", "-jar", "/usr/local/tomcat/webapps/ROOT.war"]
#CMD ["catelina.sh", "run"]

