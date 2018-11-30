node {
        stage('Checkin Code') {
                sh '''ssh rig@52.168.175.97 "git clone https://github.com/anahtreek/PCFbgd.git;\
                cd PCFbgd;\
                sudo git fetch --all;\
                sudo git reset --hard origin/master;\
                sudo chmod +x smokeTest.sh"'''
           }
        stage('Check for app') {
                try {
                    sh 'exit 1'
                }
                catch (exc) {
                    echo 'Something failed, I should sound the klaxons!'
                    throw
                } 
        }
}
