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
                cf login -a https://api.system.dev.pcf-aws.com -u keerthana.n10@wipro.com -p Indian@123 -o Pcf-training -s training;\
                echo ====$(echo `sudo cf app product` | grep -oi 'FAILED' | wc -l)"'''         
        }
}
