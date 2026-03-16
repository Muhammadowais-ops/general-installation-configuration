@Library('jenkins-shared-lib') _

pipeline {
    agent any

    stages{
        stage('class-stage'){
            steps{
                script{
                    firstTestn()
                }
            }

        }
    }

}

