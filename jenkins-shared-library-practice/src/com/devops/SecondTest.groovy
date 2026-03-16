package com.devops

class SecondTest implements Serializable {
    def script
    private String name
    private String rollNo
    private String vmIp
    private String vmName

    SecondTest(script) {
        this.script = script
    }

    def func(String name, String rollNo) {
        this.name = name
        this.rollNo = rollNo
        script.echo "${this.name} and ${this.rollNo}"
    }

    def anotherFunc() {
        def printName = script.sh(
            script: "ls -ltrh",
            returnStdout: true
        ).trim()

        script.echo printName
    }

    def mapTest(Map cfg = [:]) {
        this.vmIp = cfg.get("vm_ip", "myip")
        this.vmName = cfg.get("vm_name", "myvm_is")

        script.echo "This is ${this.vmIp} and this is ${this.vmName}"
    }
}