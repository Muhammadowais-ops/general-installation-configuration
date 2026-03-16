@Library('jenkins-shared-lib') _

pipeline {
    agent any

    stages {
        stage('Test Shared Library') {
            steps {
                script {
                    def userCheck = thirdTestn.user_ft('john')
                    echo "user check result: ${userCheck}"

                    def logUser = thirdTestn.logUser_ft([
                        logname_user: 'root'
                    ])
                    echo "log user: ${logUser}"

                    def currentPath = thirdTestn.getCurrentPath_ft()
                    echo "current path: ${currentPath}"

                    def uuid = thirdTestn.fetchuuid_ft()
                    echo "uuid: ${uuid}"
                }
            }
        }
    }
}
