FROM openjdk:8 AS BUILD_IMAGE
#FROM maven:3.5-jdk AS BUILD_IMAGE
#RUN rm -rf CI-CD-Java-App-with-ECR-ECS
RUN apt update && apt install maven -y
 
#RUN apt install git -y
#COPY CI-CD-Java-App-with-ECR-ECS/* . 
#COPY pom.xml .
RUN git clone https://github.com/nidhi221697/CI-CD-Java-App-with-ECR-ECS.git
#WORKDIR CI-CD-Java-App-with-ECR-ECS
#RUN mvn install package 
RUN mvn -f pom.xml clean package
#RUN mvn clean package

FROM tomcat:8-jre11
#remove default 
RUN rm -rf /usr/local/tomcat/webapps/*
#copy build 
COPY --from=BUILD_IMAGE CI-CD-Java-App-with-ECR-ECS/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
