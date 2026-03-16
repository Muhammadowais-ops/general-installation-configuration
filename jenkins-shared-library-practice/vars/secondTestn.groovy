import com.devops.SecondTest

def printUserInfo(String name, String rollNo) {
    def helper = new SecondTest(this)
    helper.func(name, rollNo)
}

def showFiles() {
    def helper = new SecondTest(this)
    helper.anotherFunc()
}

def showVmInfo(Map cfg = [:]) {
    def helper = new SecondTest(this)
    helper.mapTest(cfg)
}