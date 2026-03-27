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

        stage('Checkout-Parallel-Demo') {
            parallel {

                stage('Demo-Stage-1') {
                    steps {
                        echo 'Demo Stage 1 running in parallel'
                    }
                }

                stage('Demo-Stage-2') {
                    steps {
                        echo 'Demo Stage 2 running in parallel'
                    }
                }

            }
        }

    }
}
