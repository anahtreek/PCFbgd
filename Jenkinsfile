node {
        stage('Checkin Code') {
                sh '''ssh rig@52.168.175.97 "git clone https://github.com/anahtreek/PCFbgd.git;\
                cd PCFbgd;\
                sudo git fetch --all;\
                sudo git reset --hard origin/master"'''
           }
        stage('Build') {
                sh 'ssh rig@52.168.175.97 "cd PCFbgd;\
                sudo mvn install -DskipTests"'          
        }
        stage('Deploy and Smoke test') {
                sh 'ssh rig@52.168.175.97 "cd PCFbgd;\
                cf login -a https://api.system.dev.pcf-aws.com -u keerthana.n10@wipro.com -p Indian@123 -o Pcf-training -s training;\
                sudo chmod +x smokeTest.sh;\
                cf app product;\
                if [ $? -ne 0 ];then \
                echo not present;\
                cf push --no-start -n product_wipro_keerthi;\
                cf create-service p.mysql db-small  myservice;\
                cf bind-service product  myservice;\
                cf start;\
                if [ $? -ne 0 ];then cf start; fi;\
                curl -X POST -H 'content-type: application/json;charset=UTF-8' -d '{"productName":"HD SetupBox", "serviceId":"100"}' 'https://product_wipro_keerthi.apps.dev.pcf-aws.com/product' > response;\
                grep '\"serviceId\":\"100\"' 'response';\
                if [ $? -ne 0 ];then exit 1; fi;\
                else\
                echo present;\
                sudo cf bgd product --smoke-test ./smokeTest.sh;\
                fi"'          
        }
}
