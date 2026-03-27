pipeline {
agent any

 parameters {
        string(name: 'CMD', defaultValue: 'cd', description: 'command used to run or to build application')
        booleanParam(name: 'RUN_TESTS', defaultValue: false, description: 'Run tests?')
        choice(name: 'CMD1', choices: ['clean', 'validate', 'compile'], description: 'test package deploy')
    }


 
 //agent { label 'Java_Env' }
  //  agent none

    stages {
     //parallel {
     // stage('Checkout')
     //}
        stage('Checkout') {
            //agent { label 'Java_Env' }
            steps {

             withCredentials([
                    usernamePassword(
                        credentialsId: 'b2872426-b5e9-4d69-b561-e06fac549560',
                        usernameVariable: 'USERNAME',
                        passwordVariable: 'PASSWORD'
                    )
                ])
             {
              sh 'echo welcome'
             sh 'echo $CMD $RUN_TESTS $CMD1'
             sh 'echo $USERNAME $PASSWORD'
                //sh 'rm -rf *'
                //sh 'git clone https://github.com/Mallesha3/hello-world-war'
            }
            }
        }
    }
}
