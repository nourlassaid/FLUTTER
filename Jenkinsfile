pipeline {
    agent any

    environment {
        // Define any environment variables needed for the pipeline
        FLUTTER_CHANNEL = 'stable'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from the GitHub repository
                git 'https://github.com/nourlassaid/FLUTTER.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    // Set up Flutter environment
                    sh "flutter channel $FLUTTER_CHANNEL"
                    sh 'flutter pub get'

                    // Build the Docker image
                    sh 'docker build -t flutter_image .'
                }
            }
        }

        stage('Run') {
            steps {
                script {
                    // Run the Docker container
                    sh 'docker run -p 8001:8080 flutter_image'
                }
            }
        }

        // Add more stages as needed, such as testing, deployment, etc.
    }

    post {
        always {
            // Clean up resources, if needed
            script {
                sh 'docker stop $(docker ps -a -q --filter ancestor=flutter_image)'
                sh 'docker rm $(docker ps -a -q --filter ancestor=flutter_image)'
            }
        }
    }
}
