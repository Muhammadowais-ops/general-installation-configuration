// test3.groovy you check for this function

def call(Map cfg = [:]) {
    def host = cfg.get("host", "default-host")      // first is key and second is value
    def instance = cfg.get("instance", "default-instance")  // if key is present and value is given that value is go to print
    def newd = cfg.get("newd", "value11")  // incase no value is given default value of key will print
    def kd = cfg.kd ?: "always value"

    echo "Host: ${host}"
    echo "Instance: ${instance}"
    echo "Newd: ${newd}"
    echo "Kd: ${kd}"

    sh """
        echo "Host is: ${host}"
        echo "Instance is: ${instance}"
        echo "Newd is: ${newd}"
        echo "Kd is: ${kd}"
    """
}