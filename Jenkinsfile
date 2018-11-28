node {
        stage('Checkin Code') {
                sh '''ssh rig@52.168.175.97 "cd productMicroservice;sudo git fetch --all;sudo git reset --hard origin/master"'''
           }
        stage('Build') {
                sh 'ssh rig@52.168.175.97 "cd productMicroservice;sudo mvn install -DskipTests"'          
        }
        stage('BGD') {
                sh 'ssh rig@52.168.175.97 "cf login -a https://api.system.dev.pcf-aws.com -u keerthana.n10@wipro.com -p Indian@123 -o Pcf-training -s training;cd PCFbgd;cf bgd product"'          
        }
}
