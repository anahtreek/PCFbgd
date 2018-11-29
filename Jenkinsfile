node {
        stage('Checkin Code') {
                sh '''ssh rig@52.168.175.97 "git clone https://github.com/anahtreek/PCFbgd.git;
                cd PCFbgd;
                sudo git fetch --all;
                sudo git reset --hard origin/master"'''
           }
        stage('Build') {
                sh 'ssh rig@52.168.175.97 "cd PCFbgd;
                sudo mvn install -DskipTests"'          
        }
        stage('Deploy and Smoke test') {
                sh 'ssh rig@52.168.175.97 "cd PCFbgd;
                cf login -a https://api.system.dev.pcf-aws.com -u keerthana.n10@wipro.com -p Indian@123 -o Pcf-training -s training;
                cf app product;
                echo $?"'          
        }
}
