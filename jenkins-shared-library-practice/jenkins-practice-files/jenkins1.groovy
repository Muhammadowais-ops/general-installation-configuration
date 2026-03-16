@Library('jenkins-shared-lib') _
pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                testPl()
            }
        }
        stage('new'){
            steps{
                sayHello("myname",10)
            }
        }
    }
}
