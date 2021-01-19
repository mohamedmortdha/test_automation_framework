pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                    sh 'python -V '
                    sh 'pip -v'
            }
        }
    }
}
