pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                sh 'python -V '
                sh 'python -m pip3 install -r requirements.txt'
            }
        }
    }
}
