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
                sudo touch status;\
                sudo cf app product>status"'''         
        }
        stage('Deploy and Smoke test') {
                sh '''ssh rig@52.168.175.97 "cd PCFbgd;\
                export x=`grep -oi 'FAILED' status | wc -l`;\
                echo grep result;\
                echo $x"'''         
        }
}
