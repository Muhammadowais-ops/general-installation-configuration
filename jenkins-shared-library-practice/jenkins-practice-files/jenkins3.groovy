@Library('jenkins-shared-lib') _

pipeline {
    agent any

    stages {
        stage('Test groovy') {
            steps {
                script {
                    sharedHello(
                        host: 'my-server',
                        instance: 'x.x.x.x',
                        kd: ''
                    )
                }
            }
        }
    }
}
