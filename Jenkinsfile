pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'make'
                archiveArtifacts artifacts: 'bin', fingerprint: true
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
