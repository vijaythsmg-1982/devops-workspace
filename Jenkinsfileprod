pipeline {
    agent any

    parameters {
        string(name: 'CMD', defaultValue: '', description: 'command used to run or to build application')
        booleanParam(name: 'RUN_TESTS', defaultValue: true, description: 'Run tests?')
        choice(name: 'CMD1', choices: ['clean', 'validate'], description: 'test package deploy')
    }

    stages {

        stage('Checkout') {
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
                    mvn clean package
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
                    scp target/*.war root@13.233.157.86:/opt/tomcat/webapps/

                    echo "Restarting Tomcat"
                    ssh root@13.233.157.86 "
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
