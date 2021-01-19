pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                sh 'python -V '
                sh 'python -m pip -v '
            }
        }
    }
}
