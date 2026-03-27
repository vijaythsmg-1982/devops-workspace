pipeline {
agent any

 parameters {
        string(name: 'CMD', defaultValue: '', description: 'command used to run or to build application')
        booleanParam(name: 'RUN_TESTS', defaultValue: true, description: 'Run tests?')
        choice(name: 'CMD1', choices: ['clean', 'validate'], description: 'test package deploy')
    }
 
 //agent { label 'Java_Env' }
  //  agent none

    stages {
        stage('Checkout') {
            //agent { label 'Java_Env' }
            steps {
                
                sh 'rm -rf *'
                sh 'git clone https://github.com/Mallesha3/hello-world-war'
            }
        }
    
stage('Build') {
            steps {
                dir('hello-world-war') {
                    sh '''
                    pwd
                    ls
                    //mvn clean package
                    docker run -d optimus026/firstdocker:v1
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                dir('hello-world-war') {
                    sh '''
                    set -e

            echo "WAR files found:"
            ls -l target/*.war

            echo "Deploying WAR"
            scp target/*.war root@3.110.204.120:/opt/tomcat/webapps/

            echo "Restarting Tomcat"
            ssh root@3.110.204.120 "
            /opt/tomcat/bin/shutdown.sh || true
            sleep 5
            /opt/tomcat/bin/startup.sh
            "
                    '''
                }
            }
       
        }
    }
}


