import com.devops.ThirdTest

def user_ft(String username) {
    def helper = new ThirdTest(this)
    return helper.userFc(username)
}

def logUser_ft(Map config = [:]) {
    def helper = new ThirdTest(this, config)
    return helper.logUser()
}

def getCurrentPath_ft() {
    def helper = new ThirdTest(this)
    return helper.getCurrentPath()
}

def fetchuuid_ft() {
    def helper = new ThirdTest(this)
    return helper.fetchuuid()
}
