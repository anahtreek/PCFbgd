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
        stage('Login') {
                sh 'ssh rig@52.168.175.97 "cd PCFbgd;\
                sudo cf login -a https://api.system.dev.pcf-aws.com -u keerthana.n10@wipro.com -p Indian@123 -o Pcf-training -s training"'         
        }
        stage('Deploy') {
                sh '''ssh rig@52.168.175.97 "cd PCFbgd;\
                sudo rm -rf deploy.sh;\
                sudo touch deploy.sh;\
                sudo chmod 777 deploy.sh;\
                echo 'sudo cf app product
                if [ @# -ne 0 ];then 
                echo app not present
                cf push --no-start -n product_wipro_keerthi
                cf create-service p.mysql db-small  myservice
                cf bind-service product  myservice
                cf start
                if [ @# -ne 0 ];then cf start; fi
                sh smokeTest.sh
                else
                echo app present
                sudo cf bgd product --smoke-test ./smokeTest.sh
                fi'>deploy.sh;\
                sudo sed -i 's/@/$/g' deploy.sh;\
                sudo sed -i 's/#/?/g' deploy.sh;\
                sudo sh deploy.sh"'''         
        }
}

