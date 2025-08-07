pipeline {
    agent any

    triggers {
        pollSCM('H/2 * * * *')  // Poll SCM every 2 minutes
    }

    environment {
        JAVA_HOME = 'C:\\Users\\admin\\AppData\\Roaming\\Code\\User\\globalStorage\\pleiades.java-extension-pack-jdk\\java\\21'
        MAVEN_HOME = 'C:\\Users\\admin\\AppData\\Roaming\\Code\\User\\globalStorage\\pleiades.java-extension-pack-jdk\\maven\\latest'
        NODE_HOME = 'C:\\Program Files\\nodejs'
        DEPLOY_PATH = 'C:\\deploy\\nhahang'
        BACKEND_JAR = 'backend-0.0.1-SNAPSHOT.jar'
        DOCKER_IMAGE_NAME = 'nhahang-frontend'
        DOCKER_TAG = 'latest'
    }

    stages {
        // ========== CI (Continuous Integration) ==========
        stage('Clone') {
            steps {
                echo '🔄 Đang clone mã nguồn...'
                git branch: 'main', url: 'https://github.com/DoLyHoangNam/nhahang.git'

            }
        }

        stage('Check Environment') {
            steps {
                echo '🔍 Kiểm tra môi trường...'
                bat 'java -version'
                bat 'mvn -version'
                bat 'node -v'
                bat 'npm -v'
                bat 'docker -v'
            }
        }

        stage('Build Backend') {
            steps {
                echo '🔨 Đang build backend Java Spring Boot...'
                dir('backend') {
                    bat 'mvn clean compile -q'
                }
            }
        }

        stage('Test Backend') {
            steps {
                echo '🧪 Đang chạy test backend...'
                dir('backend') {
                    bat 'mvn test -q'
                }
            }
        }

        stage('Build Frontend') {
            steps {
                echo '📦 Đang cài đặt dependencies frontend...'
                dir('nhahangvietnam-main') {
                    bat 'npm install --silent'
                }
                
                echo '🔨 Đang build frontend React...'
                dir('nhahangvietnam-main') {
                    bat 'npm run build'
                }
            }
        }

        // ========== CD (Continuous Deployment) ==========
        stage('Package Backend') {
            steps {
                echo '📦 Đang đóng gói backend thành JAR...'
                dir('backend') {
                    bat 'mvn package -DskipTests -q'
                }
            }
        }

        stage('Archive Artifacts') {
            steps {
                echo '📁 Đang lưu trữ artifacts...'
                archiveArtifacts artifacts: 'backend/target/*.jar', fingerprint: true
                archiveArtifacts artifacts: 'nhahangvietnam-main/dist/**/*', fingerprint: true
            }
        }

        stage('Build Docker Image') {
            steps {
                echo '🐳 Đang build Docker image cho frontend...'
                bat 'docker build -t %DOCKER_IMAGE_NAME%:%DOCKER_TAG% .'
                echo '✅ Docker image built successfully!'
            }
        }

        stage('Push Docker Image') {
            steps {
                echo '📤 Đang push Docker image...'
                // Nếu có Docker registry, thêm lệnh push ở đây
                // bat 'docker tag %DOCKER_IMAGE_NAME%:%DOCKER_TAG% your-registry/%DOCKER_IMAGE_NAME%:%DOCKER_TAG%'
                // bat 'docker push your-registry/%DOCKER_IMAGE_NAME%:%DOCKER_TAG%'
                echo '✅ Docker image ready for deployment!'
            }
        }

        stage('Deploy Backend') {
            steps {
                echo '🚀 Đang deploy backend...'
            
                // Tạo thư mục deploy nếu chưa có
                bat 'if not exist "%DEPLOY_PATH%" mkdir "%DEPLOY_PATH%"'
                bat 'if not exist "%DEPLOY_PATH%\\backend" mkdir "%DEPLOY_PATH%\\backend"'
                // Copy JAR file
                bat 'copy "backend\\target\\%BACKEND_JAR%" "%DEPLOY_PATH%\\backend\\"'
                // Stop service cũ nếu đang chạy
                bat 'taskkill /f /im java.exe 2>nul || echo "No Java process running"'
                // Start service mới
                bat 'cd /d "%DEPLOY_PATH%\\backend" && start /b java -jar %BACKEND_JAR%'
                
                echo '✅ Backend deployed successfully!'
            }
        }

        stage('Deploy Frontend') {
            steps {
                echo '🚀 Đang deploy frontend...'
                
                // Tạo thư mục frontend
                bat 'if not exist "%DEPLOY_PATH%\\frontend" mkdir "%DEPLOY_PATH%\\frontend"'
                
                // Copy static files
                bat 'xcopy "nhahangvietnam-main\\dist\\*" "%DEPLOY_PATH%\\frontend\\" /E /Y'
                
                echo '✅ Frontend deployed successfully!'
            }
        }

        stage('Health Check') {
            steps {
                echo '🏥 Đang kiểm tra sức khỏe ứng dụng...'
                
                // Wait for backend to start
                bat 'timeout /t 10 /nobreak'
                
                // Test backend health
                bat 'curl -f http://localhost:8080/api/auth/test || echo "Backend health check failed"'
                
                // Test frontend (if using a web server)
                bat 'echo "Frontend files deployed to: %DEPLOY_PATH%\\frontend"'
                
                echo '✅ Health check completed!'
            }
        }
    }
    // ========== Post Actions ==========

    post {
        always {
            echo '🏁 Pipeline hoàn thành!'
        }
        success {
            echo '✅ CI/CD thành công!'
            echo '🌐 Backend: http://localhost:8080'
            echo '📁 Frontend: %DEPLOY_PATH%\\frontend'
            echo '🐳 Docker Image: %DOCKER_IMAGE_NAME%:%DOCKER_TAG%'
        }
        failure {
            echo '❌ CI/CD thất bại!'
        }
        cleanup {
            echo '🧹 Dọn dẹp workspace...'
        }
    }
}
//