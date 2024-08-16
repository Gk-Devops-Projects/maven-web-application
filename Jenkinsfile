node{
 
 echo "The Job name is: ${env.JOB_NAME}"
 echo "The build name is: ${env.BUILD_NUMBER}"
 echo "The Node name is: ${env.NODE_NAME}"
 echo "The Home Dir is: ${env.JENKINS_HOME}"
 
 properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])
 
 def mavenHome = tool name: "maven3.9.8"
 
 stage('CheckoutCode'){
git branch: 'development', credentialsId: '635efee0-44f4-40ee-874a-814f9fd209d6', url: 'https://github.com/Gk-Devops-Projects/maven-web-application.git'
 }
 
 stage ('Build'){
 sh "${mavenHome}/bin/mvn clean package"
 }

 stage ('ExecuteSonarQubeReport'){
 sh "${mavenHome}/bin/mvn clean sonar:sonar"
 } 
 
 stage ('UploadIntoNexus'){
 sh "${mavenHome}/bin/mvn clean deploy"
 } 
 
 stage('DeployApplicationIntoTomcat'){
 sshagent(['1fa274e7-386e-4ece-927d-46bf85faada0']){
  sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.42.236:/opt/apache-tomcat-9.0.93/webapps/ "
}
 
}
 
}
