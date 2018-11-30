node {
        stage('Checkin Code') {
                sh '''ssh rig@52.168.175.97 "git clone https://github.com/anahtreek/PCFbgd.git;\
                cd PCFbgd;\
                sudo git fetch --all;\
                sudo git reset --hard origin/master;\
                sudo chmod +x smokeTest.sh"'''
           }
        stage('Check for app') {
                sh '''ssh rig@52.168.175.97 "cd PCFbgd;\
                sudo rm -rf check.sh;\
                sudo touch check.sh;\
                sudo chmod 777 check.sh
                echo 'abc
                if [ @# -ne 0 ];then 
                echo not present
                else
                echo present
                fi'>check.sh"'''         
        }
        stage('Find and replace') {
                sh '''ssh rig@52.168.175.97 "cd PCFbgd;\
                sed -i 's/@/$/g' check.sh;\
                sed -i 's/#/?/g' check.sh"'''         
        }
}
