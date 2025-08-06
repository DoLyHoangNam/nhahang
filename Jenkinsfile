pipeline {
    agent any

    triggers {
        pollSCM('H/5 * * * *')  // Poll SCM every 5 minutes
    }

    stages {
        stage('Clone') {
            steps {
                echo 'Đang clone mã nguồn...'
                git 'https://github.com/DoLyHoangNam/nhahang.git'
            }
        }

        stage('Check Environment') {
            steps {
                echo 'Kiểm tra môi trường...'
                bat 'java -version'
                bat 'mvn -version'
                bat 'node -v'
                bat 'npm -v'
            }
        }

        stage('Build Backend') {
            steps {
                echo 'Đang build backend Java Spring Boot...'
                dir('backend') {
                    bat 'mvn clean compile -q'
                }
            }
        }

        stage('Test Backend') {
            steps {
                echo 'Đang chạy test backend...'
                dir('backend') {
                    bat 'mvn test -q'
                }
            }
        }

        stage('Build Frontend') {
            steps {
                echo 'Đang cài đặt dependencies frontend...'
                dir('nhahangvietnam-main') {
                    bat 'npm install --silent'
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
                    bat 'mvn package -DskipTests -q'
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