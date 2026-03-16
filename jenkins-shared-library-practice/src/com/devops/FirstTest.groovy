package com.devops

class FirstTest implements Serializable {
    def steps

    FirstTest(steps) {
        this.steps = steps
    }

    def newTest() {
        steps.echo "hello are we?"
    }
}