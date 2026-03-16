package com.devops

import java.util.UUID

class ThirdTest implements Serializable {

    def script
    Map config
    private String userName
    private String lognameUser

    ThirdTest(script, Map config = [:]) {
        this.script = script
        this.config = config
    }

    def userFc(String userName) {
        this.userName = userName

        String getUsername = script.sh(
            script: "bash test.sh",
            returnStdout: true
        ).trim()

        if (getUsername.contains(this.userName)) {
            script.echo "It has the value you required"
            return true
        } else {
            script.echo "Required value not found"
            return false
        }
    }

    def logUser() {
        this.lognameUser = config.get("logname_user", "root")
        script.echo "Configured logname user: ${this.lognameUser}"
        return this.lognameUser
    }

    def printStoredValues() {
        script.echo "Stored userName: ${this.userName}"
        script.echo "Stored lognameUser: ${this.lognameUser}"
    }

    def getCurrentPath() {
        def path = script.sh(
            script: "pwd",
            returnStdout: true
        ).trim()

        script.echo "Current path: ${path}"
    }

    def fetchuuid(){

        def uuid = UUID.randomUUID().toString()
        return uuid
        
    }



}