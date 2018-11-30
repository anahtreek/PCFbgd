node {
        stage('Checkin Code') {
                sh '''ssh rig@52.168.175.97 "git clone https://github.com/anahtreek/PCFbgd.git;\
                cd PCFbgd;\
                sudo git fetch --all;\
                sudo git reset --hard origin/master;\
                sudo chmod +x smokeTest.sh"'''
           }
        stage('Build') {
                sh 'ssh rig@52.168.175.97 "cd PCFbgd;\
                sudo mvn install -DskipTests"'          
        }
        stage('Check for app') {
                sh '''ssh rig@52.168.175.97 "cd PCFbgd;\
                sudo rm -rf check.sh;\
                sudo touch check.sh;\
                sudo chmod 777 check.sh
                echo 'abc
                if [ @# -ne 0 ];then 
                echo not present
                cf push --no-start -n product_wipro_keerthi
                cf create-service p.mysql db-small  myservice
                cf bind-service product  myservice
                cf start
                if [ @# -ne 0 ];then cf start; fi
                sh smokeTest.sh
                else
                echo present
                sudo cf bgd product --smoke-test ./smokeTest.sh
                fi'>check.sh;\
                "'''         
        }
}
