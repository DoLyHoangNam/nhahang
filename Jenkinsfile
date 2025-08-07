/////////////// Jenkinsfile for Frontend Deployment /////////////

pipeline {
    agent any

    environment {
        IMAGE_NAME = 'nhahang-frontend'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Clone') {
            steps {
                echo 'Clone source code...'
                git branch: 'main', url: 'https://github.com/DoLyHoangNam/nhahang.git'
            }
        }

        stage('Check Environment') {
            steps {
                echo 'Checking Node & npm version...'
                bat 'node -v'
                bat 'npm -v'
                bat 'docker -v'
            }
        }

        stage('Install & Build FE') {
            steps {
                dir('nhahangvietnam-main') {
                    bat 'npm install --silent'
                    bat 'npm run build'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat "docker build -t %IMAGE_NAME%:%IMAGE_TAG% ."
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                // Xóa container cũ nếu tồn tại
                bat 'docker rm -f nhahang-frontend-container || exit 0'
                // Chạy container mới
                bat 'docker run -d -p 8080:80 --name nhahang-frontend-container nhahang-frontend:latest'
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'nhahangvietnam-main/dist/**/*', fingerprint: true
            }
        }
    }

    post {
        success {
            echo 'Build & Deploy thành công!'
        }
        failure {
            echo 'Có lỗi xảy ra trong pipeline.'
        }
        cleanup {
            echo 'Dọn dẹp workspace...'
            cleanWs()
        }
    }