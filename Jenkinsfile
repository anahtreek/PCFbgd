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
                echo 'cf login -a https://api.system.dev.pcf-aws.com -u keerthana.n10@wipro.com -p Indian@123 -o Pcf-training -s training
                sudo cf app product
                if [ ^# -ne 0 ];then 
                echo not present
                else
                echo present
                fi'>check.sh"'''         
        }
        stage('Find and replace') {
                sh '''ssh rig@52.168.175.97 "cd PCFbgd;\
                sudo sed -i 's/^/$/g' check.sh;\
                sudo sed -i 's/#/?/g' check.sh"'''         
        }
        stage('execute') {
                sh '''ssh rig@52.168.175.97 "cd PCFbgd;\
                sudo sh check.sh"'''         
        }
}
