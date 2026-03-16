@Library('jenkins-shared-lib') _

pipeline {
    agent any

    parameters {
        string(name: 'USER_NAME', defaultValue: 'Ali', description: 'Enter user name')
        string(name: 'ROLL_NO', defaultValue: '101', description: 'Enter roll number')
        string(name: 'VM_IP', defaultValue: '192.168.1.10', description: 'Enter VM IP')
        string(name: 'VM_NAME', defaultValue: 'app-server', description: 'Enter VM name')
    }

    stages {
        stage('Call Shared Library') {
            steps {
                script {
                    secondTestn.printUserInfo(params.USER_NAME, params.ROLL_NO)
                    secondTestn.showFiles()
                    secondTestn.showVmInfo([
                        vm_ip: params.VM_IP,
                        vm_name: params.VM_NAME
                    ])
                }
            }
        }
    }
}
