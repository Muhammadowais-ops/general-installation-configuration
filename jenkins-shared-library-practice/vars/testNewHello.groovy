// Shared library
def testnd(String appname, Map cfgs = [:]) {  // Use Map type for cfgs
    // Ensure the keys exist before using them
    def pd = cfgs.get("apps", "jen")  // Default to "jen" if no value is provided for "apps"
    def kd = cfgs.get("inst", "tx.vm")  // Default to "tx.vm" if no value is provided for "inst"
    def names_val = cfgs.get("names", null)  // Default to null if no value is provided for "names"

    // Run a shell command to check if the directory exists
    def execute_kd = sh(script: "ls -ltrh", returnStdout: true).trim().split()
    def joined_output = execute_kd.join(' ')
    def jk = execute_kd.join(",")

    def path = sh(script: "pwd", returnStdout: true).trim()

    echo "${execute_kd} ${path}"
    echo "${joined_output}"
    echo "[${jk}]"

    // Check if names_val is null or empty and throw an error if so
    if (!names_val) {
        error("Error: 'names' is missing in the configuration!")
    }

    if(appname == null || appname.trim() == ""){
        error("No value")
    }

    // You can add more logic to work with 'pd', 'kd', and 'execute_kd' variables here
    echo "appname: ${appname}, pd: ${pd}, kd: ${kd}, names_val: ${names_val}"



}



def testmk() {
    echo "hello"

    echo "*******"
    def it_ls = sh(script: "cat new.txt", returnStdout: true).trim()

    it_ls.each{ file ->
        echo "${file}"
        echo "file print"

    }

}

def newtest(Map arg){
    def val = arg.value_we_need ?: []

    def func = sh(script: """
        echo "hey";
        pwd;
    """, returnStdout: true).trim()


    func.each { checks ->
        if(val.contains(checks)){
            error("no means there")
        }
        echo "checking ${checks}"
    }
}

def nkl(List my){

    my.each{ item ->
        try{
            echo "hello ${item}" 
        }
        catch(Exception e){
            echo "Caught exception: ${e.message} for item: ${item}"

        }
    }

}