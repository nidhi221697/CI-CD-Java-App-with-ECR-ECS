FROM tomcat:8-jre11
#remove default 
RUN rm -rf /usr/local/tomcat/webapps/*
#copy build 
COPY --from=BUILD_IMAGE CI-CD-Java-App-with-ECR-ECS/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
