FROM tomcat:8.0.8-jre8
COPY target/maven-web-application.war  /usr/local/tomcat/webapps/maven-web-application.war 