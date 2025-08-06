pipeline {
    agent any

    tools {
        maven 'Maven'
        nodejs 'NodeJS'
    }

    stages {
        stage('Clone') {
            steps {
                echo 'Đang clone mã nguồn...'
                git 'https://github.com/DoLyHoangNam/nhahang.git'
            }
        }

        stage('Build Backend') {
            steps {
                echo 'Đang build backend Java Spring Boot...'
                dir('backend') {
                    bat 'mvn clean compile'
                }
            }
        }

        stage('Test Backend') {
            steps {
                echo 'Đang chạy test backend...'
                dir('backend') {
                    bat 'mvn test'
                }
            }
        }

        stage('Build Frontend') {
            steps {
                echo 'Đang cài đặt dependencies frontend...'
                dir('nhahangvietnam-main') {
                    bat 'npm install'
                }
                
                echo 'Đang build frontend React...'
                dir('nhahangvietnam-main') {
                    bat 'npm run build'
                }
            }
        }

        stage('Package Backend') {
            steps {
                echo 'Đang đóng gói backend thành JAR...'
                dir('backend') {
                    bat 'mvn package -DskipTests'
                }
            }
        }

        stage('Archive Artifacts') {
            steps {
                echo 'Đang lưu trữ artifacts...'
                archiveArtifacts artifacts: 'backend/target/*.jar', fingerprint: true
                archiveArtifacts artifacts: 'nhahangvietnam-main/dist/**/*', fingerprint: true
            }
        }

        stage('Deploy') {
            steps {
                echo 'Đang chuẩn bị deploy...'
                // Có thể thêm các bước deploy ở đây
                // Ví dụ: copy files, restart services, etc.
            }
        }
    }

    post {
        always {
            echo 'Pipeline hoàn thành!'
        }
        success {
            echo 'Build thành công!'
        }
        failure {
            echo 'Build thất bại!'
        }
        cleanup {
            echo 'Dọn dẹp workspace...'
        }
    }
}