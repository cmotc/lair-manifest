pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'make'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'make full'
            }
        }
    }
}
