pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                withPythonEnv(python) {
                    sh 'python -V '
                    sh 'pip -v '}
            }
        }
    }
}
