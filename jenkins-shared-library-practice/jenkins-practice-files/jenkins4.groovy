@Library('jenkins-shared-lib') _

pipeline {
    agent any

    stages {
        stage('Test groovy') {
            steps {
                script {
                    testNewHello.testnd("Hello", [
                        apps: "jacku",  // Corrected key name
                        inst: "x.x.x.x",  // Corrected key name
                        names: "someValue"  // Added names key to avoid error
                    ])
                }
            }
        }
        stage("another function"){
            steps{
                script{
                    testNewHello.testmk()
                }
            }
        }
        stage("New stage"){
            steps{
                script{
                    testNewHello.newtest(
                        value_we_need: ["hey","new"]
                    )
                    echo "*****======"
                }
            }
        }
        stage("Last"){
            steps{
                script{
                    def myList = ["apple", "banana", "error", "cherry"]

                    testNewHello.nkl(myList)
                }
            }
        }
    }
}
