pipeline {
    environment {
        registry = 'FlasK_dictionary'
        dockerImage = ''
    }
    agent any
    stages {
        stage('Build Docker Image') {
            agent any
            steps {
                script {
                sh 'docker build -< Dockerfile'
                }
            }
        }

    }
}
