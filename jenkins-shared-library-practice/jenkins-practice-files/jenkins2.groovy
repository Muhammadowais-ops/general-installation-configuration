@Library('jenkins-shared-lib') _

pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                script {
                    byHello.rel()
                    byHello.testH(
                        name: "test",
                        test: "abc"
                    )
                }
            }
        }
    }
}
