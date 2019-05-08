#!/usr/bin/env groovy

pipeline{
    environment {
    registry = "rbgurav/amdocstest"
  }
	agent any
	options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timeout(time: 1, unit: 'HOURS')
    }
   
	stages{	
	    
        stage('Copy'){
            
            steps{
                git url: 'https://github.com/jglick/simple-maven-project-with-tests.git'
            }
        }
        
        stage('build'){
            
            steps{            
              //bat "mvn -f pom.xml clean package"
              bat "mvn package"
            }
        }
         
         stage('Building image') {
            steps{
                script {
                    //assumption is you logged in into the docker registry
                    bat "docker build" +" -t" + " amdocstest" + " ."
                    bat "docker tag amdocstest " + registry + ":$BUILD_NUMBER"
                    bat "docker tag amdocstest " + registry + ":latest"
                    bat "docker push "+ registry + ":$BUILD_NUMBER"
					bat "docker push "+ registry + ":latest"
                       }
                }
            }
		 stage('Deploy application') {
            steps{
                script {
                    //Assumption K8S/OCP is already installed and running
                    bat "minikube start --cpus 2 --memory 4096"
                    bat "kubectl apply -f amdocstest-service.yaml"
					bat "minikube service amdocstest"
                    
                       }
                }
            }
        }
        	
	}