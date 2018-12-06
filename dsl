job("Check-in") {
        steps {
     shell("ssh azureUserName@azureIp \"git clone scmUrl;\
                cd scmRepoName;\
                sudo git fetch --all;\
                sudo git reset --hard origin/master;\
                sudo chmod +x smokeTest.sh\"")
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
               shell("""ssh azureUserName@azureIp "cd scmRepoName
sudo rm -rf deploy.sh
sudo touch deploy.sh
sudo chmod 777 deploy.sh
echo 'sudo cf app appName
if [ @# -ne 0 ];then 
        echo app not present  
        sudo rm -rf servicecheck
        sudo touch servicecheck
        sudo chmod 777 servicecheck
        sudo cf create-service serviceType serviceProp serviceName
        sudo cf service serviceName > servicecheck
        grep \\"create succeeded\\" servicecheck > /dev/null
        while [ @# -ne 0 ]
        do
                echo 'sleeping'
                sleep 10s
                sudo cf service serviceName > servicecheck
                grep \\"create succeeded\\" servicecheck > /dev/null
        done
        sudo cf push --no-start
        sudo cf bind-service appName serviceName
        sudo cf start appName
        if [ @# -ne 0 ];then sudo cf start appName; fi
else
        echo app present
        sudo cf bgd appName --smoke-test ./smokeTest.sh
fi'>deploy.sh
sudo sed -i 's/@/\$/g' deploy.sh
sudo sed -i 's/#/?/g' deploy.sh
sudo sh deploy.sh"""")
        }
}


