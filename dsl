job("Check-in") {
        steps {
     shell("ssh azureUserName@azureIp \"git clone scmUrl;\
                cd scmRepoName;\
                sudo git fetch --all;\
                sudo git reset --hard origin/master;\
                sudo chmod +x smokeTestFilePath\"")
    }
}
job("Build") {
        steps {
     shell("ssh azureUserName@azureIp \"cd scmRepoName;\
                sudo mvn install -DskipTests\"")
    }
}
job("Login") {
        steps {
     shell("ssh azureUserName@azureIp \"sudo cf login -a apiEndpoint -u pcfEmailId -p pcfPassword -o pcfOrg -s pcfSpace\"")
    }
}
job("Deploy") {
        steps {
     shell("ssh azureUserName@azureIp \"cd scmRepoName;\
                sudo rm -rf deploy.sh;\
                sudo touch deploy.sh;\
                sudo chmod 777 deploy.sh;\
                echo 'sudo cf app appName
                if [ @# -ne 0 ];then 
                echo app not present
                cf push --no-start -n hostName
                cf create-service serviceType serviceProp serviceName
                cf bind-service appName serviceName
                cf start
                if [ @# -ne 0 ];then cf start; fi
                sh smokeTestFilePath
                else
                echo app present
                sudo cf bgd appName --smoke-test ./smokeTestFilePath
                fi'>deploy.sh;\
                sudo sed -i 's/@/$/g' deploy.sh;\
                sudo sed -i 's/#/?/g' deploy.sh;\
                sudo sh deploy.sh\"")
    }
}
